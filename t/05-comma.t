use v6;
use Test;
use Lingua::EN::Numbers::Cardinal;

plan *;

is comma(0),     '0'; # Int
is comma('0'),   '0'; # Str
is comma(< 0 >), '0'; # Int-Str

is comma(1001),       '1,001';   # Int
is comma(1001.0),     '1,001';   # Rat
is comma('1001.0'),   '1,001.0'; # Str
is comma(< 1001.0 >), '1,001.0'; # Rat-Str

is comma(123),     '123'; # Int
is comma('123'),   '123'; # Str
is comma(< 123 >), '123'; # Int-Str

is comma(123456789),      '123,456,789'; # Int
is comma('123456789'),    '123,456,789'; # Str
is comma(< 123456789 >),  '123,456,789'; # Int-Str
is comma(-123456789),     '-123,456,789'; # Int
is comma('-123456789'),   '-123,456,789'; # Str
is comma(< -123456789 >), '-123,456,789'; # Int-Str

is comma(12345.05),     '12,345.05'; # Rat
is comma('12345.05'),   '12,345.05'; # Str
is comma(< 12345.05 >), '12,345.05'; # Rat-Str

is comma(12345.0005),     '12,345.0005'; # Rat
is comma('12345.0005'),   '12,345.0005'; # Str
is comma(< 12345.0005 >), '12,345.0005'; # Rat-Str

is comma( 5.0e18.Int ),  '5,000,000,000,000,000,000';

dies-ok({ comma('192.168.0.1') });
dies-ok({ comma('forty-two') });
dies-ok({ comma(1.23456e9) });

done-testing();
