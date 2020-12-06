use v6;
use Test;
use Lingua::EN::Numbers;

plan *;

for 1..25 {
    is(pretty-rat(5/$_), ((5/$_).denominator == 1 ?? (5/$_).numerator !! (5/$_).nude.join('/')), "Pretty $_ ok")
}
done-testing();
