use v6;
use Test;
use Lingua::EN::Numbers :short;

plan *;

lives-ok({card(42)}, 'card() ok');
lives-ok({card-y(2020)}, 'card-y() ok');
lives-ok({ord-n(42)}, 'ord-n() ok');
lives-ok({ord-d(42)}, 'ord-d() ok');
lives-ok({prat(.875)}, 'prat() ok');

done-testing();
