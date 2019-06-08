# Lingua::EN::Numbers

## SYNOPSIS

Various number-string conversion utility routines. Convert numbers to their
cardinal or ordinal representation; add commas to numbers.

Exports the subs:
* [cardinal( )](#cardinal)
* [cardinal-year( )](#cardinal-year)
* [comma( )](#comma)
* [ordinal( )](#ordinal)
* [ordinal-digit( )](#ordinal-digit)


## DESCRIPTION

### <a name="cardinal"></a>cardinal( )

Returns cardinal representations of integers following the American English,
short scale convention.

See: https://en.wikipedia.org/wiki/Long_and_short_scales


#### cardinal( $rational, :separator($str), :denominator($val), :improper );

- **$rational**
  * value; required, any rational or integer number


- **:separator** or **:sep**
  * value; optional, separator between numerator and denominator, defaults to
    space.


- **:denominator** or **:den**
  * value; optional, integer denominator to use for representation, do not
    reduce to lowest terms.


- **:improper** or **:im**
  * flag; optional, do not regularize improper fractions.

Pass cardinal() a number or something that can be converted to one; returns its
cardinal representation.

Recognizes integer numbers from:
-9999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999999999999999999999999999999
9999999999999999999999999999999999999999999999999999999999999999999999999999
to
99999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999999999999999999999999999999
99999999999999999999999999999999999999999999999999999999999999999999999999999
999999999999999999999999999999999999999999999999999999999999999999999999999

Thats 306 9s, negative, through positive:

nine hundred ninety-nine centillion, nine hundred ninety-nine
novemnonagintillion, nine hundred ninety-nine octononagintillion, nine hundred
ninety-nine septennonagintillion, nine hundred ninety-nine sexnonagintillion,
nine hundred ninety-nine quinnonagintillion, nine hundred ninety-nine
quattuornonagintillion, nine hundred ninety-nine trenonagintillion, nine hundred
ninety-nine duononagintillion, nine hundred ninety-nine unnonagintillion, nine
hundred ninety-nine nonagintillion, nine hundred ninety-nine
novemoctogintillion, nine hundred ninety-nine octooctogintillion, nine hundred
ninety-nine septenoctogintillion, nine hundred ninety-nine sexoctogintillion,
nine hundred ninety-nine quinoctogintillion, nine hundred ninety-nine
quattuoroctogintillion, nine hundred ninety-nine treoctogintillion, nine hundred
ninety-nine duooctogintillion, nine hundred ninety-nine unoctogintillion, nine
hundred ninety-nine octogintillion, nine hundred ninety-nine
novemseptuagintillion, nine hundred ninety-nine octoseptuagintillion, nine
hundred ninety-nine septenseptuagintillion, nine hundred ninety-nine
sexseptuagintillion, nine hundred ninety-nine quinseptuagintillion, nine hundred
ninety-nine quattuorseptuagintillion, nine hundred ninety-nine
treseptuagintillion, nine hundred ninety-nine duoseptuagintillion, nine hundred
ninety-nine unseptuagintillion, nine hundred ninety-nine septuagintillion, nine
hundred ninety-nine novemsexagintillion, nine hundred ninety-nine
octosexagintillion, nine hundred ninety-nine septensexagintillion, nine hundred
ninety-nine sexsexagintillion, nine hundred ninety-nine quinsexagintillion, nine
hundred ninety-nine quattuorsexagintillion, nine hundred ninety-nine
tresexagintillion, nine hundred ninety-nine duosexagintillion, nine hundred
ninety-nine unsexagintillion, nine hundred ninety-nine sexagintillion, nine
hundred ninety-nine novemquinquagintillion, nine hundred ninety-nine
octoquinquagintillion, nine hundred ninety-nine septenquinquagintillion, nine
hundred ninety-nine sexquinquagintillion, nine hundred ninety-nine
quinquinquagintillion, nine hundred ninety-nine quattuorquinquagintillion, nine
hundred ninety-nine trequinquagintillion, nine hundred ninety-nine
duoquinquagintillion, nine hundred ninety-nine unquinquagintillion, nine hundred
ninety-nine quinquagintillion, nine hundred ninety-nine novemquadragintillion,
nine hundred ninety-nine octoquadragintillion, nine hundred ninety-nine
septenquadragintillion, nine hundred ninety-nine sexquadragintillion, nine
hundred ninety-nine quinquadragintillion, nine hundred ninety-nine
quattuorquadragintillion, nine hundred ninety-nine trequadragintillion, nine
hundred ninety-nine duoquadragintillion, nine hundred ninety-nine
unquadragintillion, nine hundred ninety-nine quadragintillion, nine hundred
ninety-nine novemtrigintillion, nine hundred ninety-nine octotrigintillion, nine
hundred ninety-nine septentrigintillion, nine hundred ninety-nine
sextrigintillion, nine hundred ninety-nine quintrigintillion, nine hundred
ninety-nine quattuortrigintillion, nine hundred ninety-nine tretrigintillion,
nine hundred ninety-nine duotrigintillion, nine hundred ninety-nine
untrigintillion, nine hundred ninety-nine trigintillion, nine hundred
ninety-nine novemvigintillion, nine hundred ninety-nine octovigintillion, nine
hundred ninety-nine septenvigintillion, nine hundred ninety-nine
sexvigintillion, nine hundred ninety-nine quinvigintillion, nine hundred
ninety-nine quattuorvigintillion, nine hundred ninety-nine trevigintillion, nine
hundred ninety-nine duovigintillion, nine hundred ninety-nine unvigintillion,
nine hundred ninety-nine vigintillion, nine hundred ninety-nine novemdecillion,
nine hundred ninety-nine octodecillion, nine hundred ninety-nine
septendecillion, nine hundred ninety-nine sexdecillion, nine hundred ninety-nine
quindecillion, nine hundred ninety-nine quattuordecillion, nine hundred
ninety-nine tredecillion, nine hundred ninety-nine duodecillion, nine hundred
ninety-nine undecillion, nine hundred ninety-nine decillion, nine hundred
ninety-nine nonillion, nine hundred ninety-nine octillion, nine hundred
ninety-nine septillion, nine hundred ninety-nine sextillion, nine hundred
ninety-nine quintillion, nine hundred ninety-nine quadrillion, nine hundred
ninety-nine trillion, nine hundred ninety-nine billion, nine hundred ninety-nine
million, nine hundred ninety-nine thousand, nine hundred ninety-nine

Handles Rats limited to the integer limits for the numerator and denominator.

When converting rational numbers, the word "and" is inserted between any whole
number portion and the fractional portions of the number. If you have an "and"
in the output, the input number had a fractional portion.

By default, cardinal reduces fractions to their lowest terms. If you want to
specify the denominator used to display, pass in an integer to the :denominator
option.

It is probably best to specify a denominator that is a common divisor for
the denominator. cardinal() will work with any integer denominator, and will
scale the numerator to match, but will round off the numerator to the nearest
integer after scaling, so some error will creep in if denominator is NOT a
common divisor with the denominator.


Recognizes Nums up to about 1.79e308.

When converting Nums, reads out the enumerated digits for the mantissa and
returns the ordinal exponent.

E.G. cardinal(2.712e7) will return:

    two point seven one two times ten to the seventh

If you want it to be treated like an integer or rational, coerce it to the
appropriate type.

cardinal(2.712e7.Int) to get:

    twenty-seven million, one hundred twenty thousand

cardinal(1.25e-3) returns:

    one point two five times ten to the negative third

cardinal(1.25e-3.Rat) returns:

    one eight hundredth

----
## <a name="cardinal-year"></a>cardinal-year( )

Converts integers from 1 to 9999 to the common American English convention.

#### cardinal-year( $year, :oh($str) );

* **$year**
  * value; must be an integer between 1 and 10000.


* **:oh**
  * value; optional, string to use for the "0" years after a millennium. Default
    'oh-'. Change to ' ought-' or some other string if desired.


Follows the common American English convention for years:

    2015 -> twenty fifteen.

    1984 -> nineteen eighty-four.

Even millenniums are returned as thousands:

    2000 -> two thousand.

Even centuries are returned as hundreds:

    1900 -> nineteen hundred.

Years 1 .. 9 in each century are returned as ohs:

    2001 -> twenty oh-one.

Configurable with the :oh parameter. Default is 'oh-'. Change to
'ought-' if you prefer twenty ought-one, or something else if that is your
preference.

----

## <a name="comma"></a>comma( )

Insert commas into a numeric string following the English convention. Groups of
three orders-of-magnitude for whole numbers, fractional portions are unaffected.

#### comma( $number )
  * **$number**
    * value; an integer, rational, int-string, rat-string or numeric
  string.


Will accept an Integer, Int-String, Rational, Rat-String or a numeric string
that looks like an Integer or Rational. Any non-significant leading zeros are
dropped. Non-significant trailing zeros are dropped for numeric rationals. If
you want to retain non-significant trailing zeros, pass the argument as a
string.

----
## <a name="ordinal"></a>ordinal( )

Takes an integer or something that can be coerced to an integer and returns a
string similar to the cardinal() routine except it is "positional" rather than
valuation. E.G. 'first' rather than 'one', 'eleventh' rather than 'eleven'.

#### ordinal( $integer )
  * **$integer**
    * value; an integer or something that can be coerced to a sensible integer
      value.

----
## <a name="ordinal-digit"></a>ordinal-digit( )

Takes an integer or something that can be coerced to an integer and returns the
given numeric value with the appropriate suffix appended to the number. 1 ->
1st, 3 -> 3rd, 24 -> 24th etc.

#### ordinal-digit( $integer, :u )

* **$integer**
  * value; an integer or something that can be coerced to a sensible integer
    value.


* **:u**
  * boolean; enable Unicode superscript ordinal suffixes (ˢᵗ, ⁿᵈ, ʳᵈ, ᵗʰ). Default
    false.

----

## USAGE


    use Lingua::EN::Numbers;

    # Integers
    say cardinal(42);             # forty-two
    say cardinal('144');          # one hundred forty-four
    say cardinal(76541);          # seventy-six thousand, five hundred forty-one

    # Rationals
    say cardinal(7/2);            # three and one half
    say cardinal(7/2, :improper); # seven halves
    say cardinal(7/2, :im );      # seven halves
    say cardinal(15/4)            # three and three quarters
    say cardinal(3.75)            # three and three quarters
    say cardinal(15/4, :improper) # fifteen quarters
    say cardinal('3/16');         # three sixteenths

    # Years
    say cardinal-year(1800)       # eighteen hundred
    say cardinal-year(1905)       # nineteen oh-five
    say cardinal-year(2000)       # two thousand
    say cardinal-year(2015)       # twenty fifteen

    # cardinal vs. cardinal-year
    say cardinal(1776);           # one thousand, seven hundred seventy-six
    say cardinal-year(1776)       # seventeen seventy-six


    # Sometimes larger denominators make it difficult to discern where the
    # numerator ends and the denominator begins. Change the separator to
    # make it easier to tell.

    say cardinal(97873/10000000);
    # ninety seven thousand, eight hundred seventy-three ten millionths

    say cardinal(97873/10000000, :separator(' / '));
    # ninety seven thousand, eight hundred seventy-three / ten millionths


    # If you want to use a certain denominator in the display and not reduce
    # fractions, specify a common denominator.

    say cardinal(15/1000);                      # three two hundredths
    say cardinal(15/1000, :denominator(1000));  # fifteen thousandths
    # or
    say cardinal(15/1000, denominator => 1000); # fifteen thousandths
    # or
    say cardinal(15/1000, :den(1000) );         # fifteen thousandths

    # Ordinals
    say ordinal(1);               # first
    say ordinal(2);               # second
    say ordinal(123);             # one hundred twenty-third

    # Ordinal digit
    say ordinal-digit(22);        # 22nd
    say ordinal-digit(1776);      # 1776th
    say ordinal-digit(331 :u);    # 331ˢᵗ

    # Commas
    say comma( 5.0e9.Int );       # 5,000,000,000
    say comma( -123456 );         # -123,456
    say comma(  7832.00 );        # 7,832
    say comma( '7832.00' );       # 7,832.00


## BUGS

Doesn't handle complex numbers. Does some cursory error trapping and
coercion but the foot cannon is still loaded.


## AUTHOR

Original Integer cardinal code by TimToady (Larry Wall).

See: http://rosettacode.org/wiki/Number_names#Perl_6

Other code by thundergnat (Steve Schulze).

## LICENSE

Licensed under The Artistic 2.0; see LICENSE.