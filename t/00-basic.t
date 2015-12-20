use v6;
use Test;
use Lingua::EN::Numbers::Cardinal;

plan 13;

is ((join ', ', (1..10)».&cardinal), 'one, two, three, four, five, six, seven, eight, nine, ten');

is (cardinal(0), 'zero');
is (cardinal(10019), 'ten thousand, nineteen');
is (cardinal(-1234567812), 'negative one billion, two hundred thirty four million, five hundred sixty seven thousand, eight hundred twelve');
is (cardinal(42000), 'forty two thousand');
is (cardinal(198723483017417), 'one hundred ninety eight trillion, seven hundred twenty three billion, four hundred eighty three million, seventeen thousand, four hundred seventeen');

is (cardinal-year(2002), 'twenty-ought-two');
is (cardinal-year(2000), 'two-thousand');
is (cardinal-year(100), 'one-hundred');
is (cardinal-year(2015), 'twenty-fifteen');
is (cardinal-year(2525), 'twenty-five-twenty-five');
is (cardinal-year(1976), 'nineteen-seventy-six');
is (cardinal-year(1900), 'nineteen-hundred');

done-testing();
