NAME Lingua::EN::Numbers
========================

[![test](https://github.com/thundergnat/Lingua-EN-Numbers/actions/workflows/test.yml/badge.svg)](https://github.com/thundergnat/Lingua-EN-Numbers/actions/workflows/test.yml)

Various number-string conversion utility routines.

Convert numbers to their cardinal or ordinal representation.

Several other numeric string "prettifying" routines.

SYNOPSIS
========

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
    say ordinal-digit(12343 :c);  # 12,343rd

    # Use pretty-rat() to print rational strings as fractions rather than
    # as decimal numbers. Whole number fractions will be reduced to Ints.
    say pretty-rat(1.375); # 11/8
    say pretty-rat(8/2);   # 4

    # no-commas flag

    # save state
    my $state = no-commas?;

    # disable commas
    no-commas;

    say cardinal(97873/10000000);
    # ninety seven thousand eight hundred seventy-three ten millionths

    # restore state
    no-commas($state);


    # Commas routine
    say comma( 5.0e9.Int );       # 5,000,000,000
    say comma( -123456 );         # -123,456
    say comma(  7832.00 );        # 7,832
    say comma( '7832.00' );       # 7,832.00

    # Super routine
    say super('32');              # ³²
    say super -47;                # ⁻⁴⁷

Or, import the short form routine names:

    use Lingua::EN::Numbers :short;

    say card(42);    # forty-two
    say card-y(2020) # twenty twenty
    say ord-n(42);   # forty-second
    say ord-d(42);   # 42nd
    say card(.875)   # seven eights
    say prat(.875);  # 7/8

DESCRIPTION
===========

Exports the Subs:

  * [cardinal( )](#cardinal) - short: card()

  * [cardinal-year( )](#cardinal-year) - short: card-y()

  * [ordinal( )](#ordinal) - short: ord-n()

  * [ordinal-digit( )](#ordinal-digit) - short: ord-d()

  * [comma( )](#comma)

  * [pretty-rat( )](#pretty-rat) - short: prat()

  * [super( )](#super)

and Flag:

  * [no-commas](#no-commas)

Short form routine names are only available if you specifically import them:

`use Lingua::EN::Numbers :short;`

<a name="cardinal"></a>cardinal( ) - short: card()
--------------------------------------------------

Returns cardinal representations of integers following the American English, short scale convention.

See: https://en.wikipedia.org/wiki/Long_and_short_scales

### cardinal( $number, :separator($str), :denominator($val), :improper );

  * $number

    * value; required, any Real number (Rat, Int, or Num)

  * :separator or :sep

    * value; optional, separator between numerator and denominator, defaults to space. Ignored if a non Rat is passed in.

  * :denominator or :den

    * value; optional, integer denominator to use for representation, do not reduce to lowest terms. Ignored if a non Rat is passed in.

  * :improper or :im

    * flag; optional, do not regularize improper fractions. Ignored if a non Rat is passed in.

Pass `cardinal()` a number or something that can be converted to one; returns its cardinal representation.

Recognizes integer numbers from: -9999999999999999999999999999999999999999999999999999999999999999999999999999 99999999999999999999999999999999999999999999999999999999999999999999999999999 99999999999999999999999999999999999999999999999999999999999999999999999999999 9999999999999999999999999999999999999999999999999999999999999999999999999999 to 99999999999999999999999999999999999999999999999999999999999999999999999999999 99999999999999999999999999999999999999999999999999999999999999999999999999999 99999999999999999999999999999999999999999999999999999999999999999999999999999 999999999999999999999999999999999999999999999999999999999999999999999999999

Thats 306 9s, negative, through positive:

nine hundred ninety-nine centillion, nine hundred ninety-nine novemnonagintillion, nine hundred ninety-nine octononagintillion, nine hundred ninety-nine septennonagintillion, nine hundred ninety-nine sexnonagintillion, nine hundred ninety-nine quinnonagintillion, nine hundred ninety-nine quattuornonagintillion, nine hundred ninety-nine trenonagintillion, nine hundred ninety-nine duononagintillion, nine hundred ninety-nine unnonagintillion, nine hundred ninety-nine nonagintillion, nine hundred ninety-nine novemoctogintillion, nine hundred ninety-nine octooctogintillion, nine hundred ninety-nine septenoctogintillion, nine hundred ninety-nine sexoctogintillion, nine hundred ninety-nine quinoctogintillion, nine hundred ninety-nine quattuoroctogintillion, nine hundred ninety-nine treoctogintillion, nine hundred ninety-nine duooctogintillion, nine hundred ninety-nine unoctogintillion, nine hundred ninety-nine octogintillion, nine hundred ninety-nine novemseptuagintillion, nine hundred ninety-nine octoseptuagintillion, nine hundred ninety-nine septenseptuagintillion, nine hundred ninety-nine sexseptuagintillion, nine hundred ninety-nine quinseptuagintillion, nine hundred ninety-nine quattuorseptuagintillion, nine hundred ninety-nine treseptuagintillion, nine hundred ninety-nine duoseptuagintillion, nine hundred ninety-nine unseptuagintillion, nine hundred ninety-nine septuagintillion, nine hundred ninety-nine novemsexagintillion, nine hundred ninety-nine octosexagintillion, nine hundred ninety-nine septensexagintillion, nine hundred ninety-nine sexsexagintillion, nine hundred ninety-nine quinsexagintillion, nine hundred ninety-nine quattuorsexagintillion, nine hundred ninety-nine tresexagintillion, nine hundred ninety-nine duosexagintillion, nine hundred ninety-nine unsexagintillion, nine hundred ninety-nine sexagintillion, nine hundred ninety-nine novemquinquagintillion, nine hundred ninety-nine octoquinquagintillion, nine hundred ninety-nine septenquinquagintillion, nine hundred ninety-nine sexquinquagintillion, nine hundred ninety-nine quinquinquagintillion, nine hundred ninety-nine quattuorquinquagintillion, nine hundred ninety-nine trequinquagintillion, nine hundred ninety-nine duoquinquagintillion, nine hundred ninety-nine unquinquagintillion, nine hundred ninety-nine quinquagintillion, nine hundred ninety-nine novemquadragintillion, nine hundred ninety-nine octoquadragintillion, nine hundred ninety-nine septenquadragintillion, nine hundred ninety-nine sexquadragintillion, nine hundred ninety-nine quinquadragintillion, nine hundred ninety-nine quattuorquadragintillion, nine hundred ninety-nine trequadragintillion, nine hundred ninety-nine duoquadragintillion, nine hundred ninety-nine unquadragintillion, nine hundred ninety-nine quadragintillion, nine hundred ninety-nine novemtrigintillion, nine hundred ninety-nine octotrigintillion, nine hundred ninety-nine septentrigintillion, nine hundred ninety-nine sextrigintillion, nine hundred ninety-nine quintrigintillion, nine hundred ninety-nine quattuortrigintillion, nine hundred ninety-nine tretrigintillion, nine hundred ninety-nine duotrigintillion, nine hundred ninety-nine untrigintillion, nine hundred ninety-nine trigintillion, nine hundred ninety-nine novemvigintillion, nine hundred ninety-nine octovigintillion, nine hundred ninety-nine septenvigintillion, nine hundred ninety-nine sexvigintillion, nine hundred ninety-nine quinvigintillion, nine hundred ninety-nine quattuorvigintillion, nine hundred ninety-nine trevigintillion, nine hundred ninety-nine duovigintillion, nine hundred ninety-nine unvigintillion, nine hundred ninety-nine vigintillion, nine hundred ninety-nine novemdecillion, nine hundred ninety-nine octodecillion, nine hundred ninety-nine septendecillion, nine hundred ninety-nine sexdecillion, nine hundred ninety-nine quindecillion, nine hundred ninety-nine quattuordecillion, nine hundred ninety-nine tredecillion, nine hundred ninety-nine duodecillion, nine hundred ninety-nine undecillion, nine hundred ninety-nine decillion, nine hundred ninety-nine nonillion, nine hundred ninety-nine octillion, nine hundred ninety-nine septillion, nine hundred ninety-nine sextillion, nine hundred ninety-nine quintillion, nine hundred ninety-nine quadrillion, nine hundred ninety-nine trillion, nine hundred ninety-nine billion, nine hundred ninety-nine million, nine hundred ninety-nine thousand, nine hundred ninety-nine

Handles Rats limited to the integer limits for the numerator and denominator.

When converting rational numbers, the word "and" is inserted between any whole number portion and the fractional portions of the number. If you have an "and" in the output, the input number had a fractional portion.

By default, `cardinal()` reduces fractions to their lowest terms. If you want to specify the denominator used to display, pass in an integer to the :denominator option.

It is probably best to specify a denominator that is a common divisor for the denominator. `cardinal()` will work with any integer denominator, and will scale the numerator to match, but will round off the numerator to the nearest integer after scaling, so some error will creep in if denominator is NOT a common divisor with the denominator.

Recognizes Nums up to about 1.79e308. (2¹⁰²⁴ - 1)

When converting Nums, reads out the enumerated digits for the mantissa and returns the ordinal exponent.

E.G. `cardinal(2.712e7)` will return:

    two point seven one two times ten to the seventh

If you want it to be treated like an integer or rational, coerce it to the appropriate type.

`cardinal(2.712e7.Int)` to get:

    twenty-seven million, one hundred twenty thousand

`cardinal(1.25e-3)` returns:

    one point two five times ten to the negative third

`cardinal(1.25e-3.Rat)` returns:

    one eight hundredth

<a name="cardinal-year"></a>cardinal-year( ) - short: card-y()
--------------------------------------------------------------

Converts integers from 1 to 9999 to the common American English convention.

### cardinal-year( $year, :oh($str) );

  * $year

    * value; must be an integer between 1 and 9999 or something that can be coerced to an integer between 1 and 9999.

  * :oh

    * value; optional, string to use for the "0" years after a millennium. Default 'oh-'. Change to ' ought-' or some other string if desired.

Follows the common American English convention for years:

    2015 -> twenty fifteen.

    1984 -> nineteen eighty-four.

Even millenniums are returned as thousands:

    2000 -> two thousand.

Even centuries are returned as hundreds:

    1900 -> nineteen hundred.

Years 1 .. 9 in each century are returned as ohs:

    2001 -> twenty oh-one.

Configurable with the :oh parameter. Default is 'oh-'. Change to 'ought-' if you prefer twenty ought-one, or something else if that is your preference.

<a name="ordinal"></a>ordinal( ) - short: ord-n()
-------------------------------------------------

Takes an integer or something that can be coerced to an integer and returns a string similar to the cardinal() routine except it is positional rather than valuation.

E.G. 'first' rather than 'one', 'eleventh' rather than 'eleven'.

### ordinal( $integer )

  * $integer

    * value; an integer or something that can be coerced to a sensible integer value.

<a name="ordinal-digit"></a>ordinal-digit( ) - short: ord-d()
-------------------------------------------------------------

Takes an integer or something that can be coerced to an integer and returns the given numeric value with the appropriate suffix appended to the number. 1 -> 1st, 3 -> 3rd, 24 -> 24th etc.

### ordinal-digit( $integer, :u, :c )

  * $integer

    * value; an integer or something that can be coerced to a sensible integer value.

  * :u

    * boolean; enable Unicode superscript ordinal suffixes (ˢᵗ, ⁿᵈ, ʳᵈ, ᵗʰ). Default false.

  * :c

    * boolean; add commas to the ordinal number. Default false.

<a name="comma"></a>comma( )
----------------------------

Insert commas into a numeric string following the English convention. Groups of 3-orders-of-magnitude for whole numbers, fractional portions are unaffected.

### comma( $number )

  * $number

    * value; an integer, rational, int-string, rat-string or numeric string.

Will accept an Integer, Int-String, Rational, Rat-String or a numeric string that looks like an Integer or Rational. Any non-significant leading zeros are dropped. Non-significant trailing zeros are dropped for numeric rationals. If you want to retain non-significant trailing zeros in Rats, pass the argument as a string.

<a name="pretty-rat"></a> pretty-rat() - short: prat()
------------------------------------------------------

A "prettifying" routine to render rational numbers as a fraction. Rats that have a denominator of 1 will be rendered as integers.

### pretty-rat($number)

  * $number

    * value; Any real number. Integers and Nums will be passed along unchanged; Rats will be converted to a fractional representation.

<a name="no-commas"></a>no-commas
---------------------------------

A global flag for the `cardinal()` and `ordinal()` routines that disables / enables returning commas between 3-order-of-magnitude groups.

<a name="pretty-rat"></a> pretty-rat() - short: prat()
------------------------------------------------------

A "prettifying" routine to render rational numbers as a fraction. Rats that have a denominator of 1 will be rendered as integers.

<a name="super"></a> super()
----------------------------

A "prettifying" routine to render numbers as Unicode superscripts. Mostly for formatting output strings. Not convieniently usable for a variable exponent.

### super($number)

  * $number

    * value; Any real integer or integer string.

Note that a numeric of -0 will be superscripted to ⁰ since Raku treats numeric -0 and 0 as equivalent. If it is important to have the negative sign show up, pass the value as a string "-0". Provides superscript versions of: +-0123456789()ei . Technically, super will work with any numeric, but Unicode does not offer a superscript decimal point, so it is of limited use for rationals and scientific notation.

<a name="no-commas"></a>no-commas
---------------------------------

A global flag for the `cardinal()` and `ordinal()` routines that disables / enables returning commas between 3-order-of-magnitude groups.

### no-commas( $bool )

  * $bool

    * A truthy / falsey value to enable / disable inserting commas into spelled out numeric strings.

Takes a Boolean or any value that can be coerced to a Boolean as a flag to disable / enable inserting commas. Absence of a value is treated as True. E.G.

    no-commas;

is the same as

    no-commas(True);

to re-enable inserting commas:

    no-commas(False);

Disabled (False) by default. May be enabled and disabled as desired, even within a single block; the flag is global though, not lexical. If you disable commas deep within a block, it will affect all `ordinal()` and `cardinal()` calls afterwords, even in a different scope. If your script is part of a larger application, you may want to query the `no-commas` state and restore it after any modification.

Query the no-commas flag state with:

    my $state = no-commas?;

Returns the current flag state as a Boolean: True - commas disabled, False - commas enabled. Does not modify the current state.

Restore it with:

    no-commas($state);

NOTE: the `comma()` routine and `no-commas` flag have nothing to do with each other, do not interact, and serve completely different purposes.

----

BUGS
====

Doesn't handle complex numbers. Does some cursory error trapping and coercion but the foot cannon is still loaded.

AUTHOR
======

Original Integer cardinal code by TimToady (Larry Wall).

See: http://rosettacode.org/wiki/Number_names#Raku

Other code by thundergnat (Steve Schulze).

LICENSE
=======

Licensed under The Artistic 2.0; see LICENSE.

