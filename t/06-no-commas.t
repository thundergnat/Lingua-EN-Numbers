use v6;
use Test;
use Lingua::EN::Numbers;

plan *;

is(no-commas?, False, 'Able to query no-commas flag');

no-commas;

is(no-commas?, True, 'Able to query no-commas flag');

# Can suppress commas
is(cardinal(-1008), 'negative one thousand eight', '-1008 Int - Can suppress commas');
is(cardinal(10019), 'ten thousand nineteen', '10019 Int - Can suppress commas');
is(cardinal(-1234567812), 'negative one billion two hundred thirty-four million five hundred sixty-seven thousand eight hundred twelve', '-1234567812 Int - Can suppress commas');
is(cardinal(198723483017417), 'one hundred ninety-eight trillion seven hundred twenty-three billion four hundred eighty-three million seventeen thousand four hundred seventeen', '198723483017417 Int - Can suppress commas');

is ordinal(8316), "eight thousand three hundred sixteenth", "8316 is eight thousand three hundred sixteenth - Can suppress commas";
is ordinal(20639), "twenty thousand six hundred thirty-ninth", "20639 is twenty thousand six hundred thirty-ninth - Can suppress commas";
is ordinal(3040005000), "three billion forty million five thousandth", "3040005000 is three billion forty million five thousandth - Can suppress commas";

no-commas(False);

# And re-enable them
is(cardinal(-1008), 'negative one thousand, eight', '-1008 Int - Can re-enable commas');
is(cardinal(10019), 'ten thousand, nineteen', '10019 Int - Can re-enable commas');
is(cardinal(-1234567812), 'negative one billion, two hundred thirty-four million, five hundred sixty-seven thousand, eight hundred twelve', '-1234567812 Int - Can re-enable commas');
is(cardinal(198723483017417), 'one hundred ninety-eight trillion, seven hundred twenty-three billion, four hundred eighty-three million, seventeen thousand, four hundred seventeen', '198723483017417 Int - Can re-enable commas');

is ordinal(8316), "eight thousand, three hundred sixteenth", "8316 is eight thousand, three hundred sixteenth - Can re-enable commas";
is ordinal(20639), "twenty thousand, six hundred thirty-ninth", "20639 is twenty thousand, six hundred thirty-ninth - Can re-enable commas";
is ordinal(3040005000), "three billion, forty million, five thousandth", "3040005000 is three billion, forty million, five thousandth - Can re-enable commas";

done-testing();
