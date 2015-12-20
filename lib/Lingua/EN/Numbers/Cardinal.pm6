
use v6;

unit module Lingua::EN::Numbers::Cardinal;

constant @I = <zero one    two    three    four     five    six     seven     eight    nine
               ten  eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen>;
constant @X = <0    X      twenty thirty   forty    fifty   sixty   seventy   eighty   ninety>;
constant @C = @I »~» ' hundred';
constant @M = (<0 thousand>,
    ((<m b tr quadr quint sext sept oct non>,
    (map { ('', <un duo tre quattuor quin sex septen octo novem>).flat X~ $_ },
    <dec vigint trigint quadragint quinquagint sexagint septuagint octogint nonagint>),
    'cent').flat X~ 'illion')).flat;

sub cardinal ($num is copy) is export {
    $num.=floor;
    if $num.substr(0,1) eq '-' { return "negative {cardinal($num.substr(1))}" }
    if $num eq '0' { return @I[0] }
    my $m = 0;
    return join ', ', reverse gather for $num.flip.comb(/\d ** 1..3/) {
        my ( $i, $x, $c ) = .comb».Int;
        if $i or $x or $c {
            take join ' ', gather {
                if $c { take @C[$c] }
                if $x and $x == 1 { take @I[$i+10] }
                else {
                    if $x { take @X[$x] }
                    if $i { take @I[$i] }
                }
                take @M[$m] // die "WOW! ZILLIONS!\n" if $m;
            }
        }
        $m++;
    }
}

sub cardinal-year ($year where 0 < $year < 10000) is export {
    if $year %% 1000 {
        return cardinal($year.substr(0,1)) ~ '-thousand';
    } elsif $year %% 100  {
        my ($, $cen) = $year.flip.comb(/\d ** 1..2/);
        return cardinal($cen.flip) ~ '-hundred';
    }
    my ($l, $h) = $year.flip.comb(/\d ** 1..2/).».flip;
    if $l < 10 {
        return cardinal($h) ~ '-ought-' ~ cardinal($l);
    }
    return (join '-', cardinal($h), cardinal($l)).words.join: '-';
}
