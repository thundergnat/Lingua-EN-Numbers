use v6;
use Test;
use Lingua::EN::Numbers;

plan *;

is ordinal-digit(0), "0th", "0 is 0th";
is ordinal-digit(1), "1st", "1 is 1st";
is ordinal-digit(2), "2nd", "2 is 2nd";
is ordinal-digit(3), "3rd", "3 is 3rd";
is ordinal-digit(4), "4th", "4 is 4th";
is ordinal-digit(5), "5th", "5 is 5th";
is ordinal-digit(6), "6th", "6 is 6th";
is ordinal-digit(7), "7th", "7 is 7th";
is ordinal-digit(8), "8th", "8 is 8th";
is ordinal-digit(9), "9th", "9 is 9th";

is ordinal-digit(10), "10th", "10 is 10th";
is ordinal-digit(11), "11th", "11 is 11th";
is ordinal-digit(12), "12th", "12 is 12th";
is ordinal-digit(13), "13th", "13 is 13th";
is ordinal-digit(14), "14th", "14 is 14th";
is ordinal-digit(15), "15th", "15 is 15th";
is ordinal-digit(16), "16th", "16 is 16th";
is ordinal-digit(17), "17th", "17 is 17th";
is ordinal-digit(18), "18th", "18 is 18th";
is ordinal-digit(19), "19th", "19 is 19th";

is ordinal-digit(20), "20th", "20 is 20th";
is ordinal-digit(21), "21st", "21 is 21st";
is ordinal-digit(30), "30th", "30 is 30th";
is ordinal-digit(32), "32nd", "32 is 32nd";
is ordinal-digit(40), "40th", "40 is 40th";
is ordinal-digit(43), "43rd", "43 is 43rd";
is ordinal-digit(50), "50th", "50 is 50th";
is ordinal-digit(54), "54th", "54 is 54th";
is ordinal-digit(60), "60th", "60 is 60th";
is ordinal-digit(65), "65th", "65 is 65th";
is ordinal-digit(70), "70th", "70 is 70th";
is ordinal-digit(76), "76th", "76 is 76th";
is ordinal-digit(80), "80th", "80 is 80th";
is ordinal-digit(87), "87th", "87 is 87th";
is ordinal-digit(90), "90th", "90 is 90th";
is ordinal-digit(98), "98th", "98 is 98th";
is ordinal-digit(99), "99th", "99 is 99th";

is ordinal-digit(100), "100th", "100 is 100th";
is ordinal-digit(101), "101st", "101 is 101st";
is ordinal-digit(102), "102nd", "102 is 102nd";
is ordinal-digit(103), "103rd", "103 is 103rd";
is ordinal-digit(104), "104th", "104 is 104th";
is ordinal-digit(105), "105th", "105 is 105th";
is ordinal-digit(106), "106th", "106 is 106th";
is ordinal-digit(107), "107th", "107 is 107th";
is ordinal-digit(108), "108th", "108 is 108th";
is ordinal-digit(109), "109th", "109 is 109th";

is ordinal-digit(110), "110th", "110 is 110th";
is ordinal-digit(111), "111th", "111 is 111th";
is ordinal-digit(112), "112th", "112 is 112th";
is ordinal-digit(113), "113th", "113 is 113th";
is ordinal-digit(114), "114th", "114 is 114th";

is ordinal-digit(-1), "-1st", "-1 is -1st";
is ordinal-digit(-2), "-2nd", "-2 is -2nd";
is ordinal-digit(-3), "-3rd", "-3 is -3rd";
is ordinal-digit(-10), "-10th", "-10 is -10th";
is ordinal-digit(-11), "-11th", "-11 is -11th";
is ordinal-digit(-12), "-12th", "-12 is -12th";
is ordinal-digit(-13), "-13th", "-13 is -13th";
is ordinal-digit(-14), "-14th", "-14 is -14th";
is ordinal-digit(-15), "-15th", "-15 is -15th";
is ordinal-digit(-40), "-40th", "-40 is -40th";
is ordinal-digit(-50), "-50th", "-50 is -50th";
is ordinal-digit(-90), "-90th", "-90 is -90th";
is ordinal-digit(-123), "-123rd", "-123 is -123rd";

is ordinal-digit(0, :u), "0ᵗʰ", "0 is 0ᵗʰ";
is ordinal-digit(1, :u), "1ˢᵗ", "1 is 1ˢᵗ";
is ordinal-digit(2, :u), "2ⁿᵈ", "2 is 2ⁿᵈ";
is ordinal-digit(3, :u), "3ʳᵈ", "3 is 3ʳᵈ";
is ordinal-digit(4, :u), "4ᵗʰ", "4 is 4ᵗʰ";
is ordinal-digit(5, :u), "5ᵗʰ", "5 is 5ᵗʰ";
is ordinal-digit(6, :u), "6ᵗʰ", "6 is 6ᵗʰ";
is ordinal-digit(7, :u), "7ᵗʰ", "7 is 7ᵗʰ";
is ordinal-digit(8, :u), "8ᵗʰ", "8 is 8ᵗʰ";
is ordinal-digit(9, :u), "9ᵗʰ", "9 is 9ᵗʰ";

is ordinal-digit(10, :u), "10ᵗʰ", "10 is 10ᵗʰ";
is ordinal-digit(11, :u), "11ᵗʰ", "11 is 11ᵗʰ";
is ordinal-digit(12, :u), "12ᵗʰ", "12 is 12ᵗʰ";
is ordinal-digit(13, :u), "13ᵗʰ", "13 is 13ᵗʰ";
is ordinal-digit(14, :u), "14ᵗʰ", "14 is 14ᵗʰ";
is ordinal-digit(15, :u), "15ᵗʰ", "15 is 15ᵗʰ";
is ordinal-digit(16, :u), "16ᵗʰ", "16 is 16ᵗʰ";
is ordinal-digit(17, :u), "17ᵗʰ", "17 is 17ᵗʰ";
is ordinal-digit(18, :u), "18ᵗʰ", "18 is 18ᵗʰ";
is ordinal-digit(19, :u), "19ᵗʰ", "19 is 19ᵗʰ";

is ordinal-digit(20, :u), "20ᵗʰ", "20 is 20ᵗʰ";
is ordinal-digit(21, :u), "21ˢᵗ", "21 is 21ˢᵗ";
is ordinal-digit(30, :u), "30ᵗʰ", "30 is 30ᵗʰ";
is ordinal-digit(32, :u), "32ⁿᵈ", "32 is 32ⁿᵈ";
is ordinal-digit(40, :u), "40ᵗʰ", "40 is 40ᵗʰ";
is ordinal-digit(43, :u), "43ʳᵈ", "43 is 43ʳᵈ";
is ordinal-digit(50, :u), "50ᵗʰ", "50 is 50ᵗʰ";
is ordinal-digit(54, :u), "54ᵗʰ", "54 is 54ᵗʰ";
is ordinal-digit(60, :u), "60ᵗʰ", "60 is 60ᵗʰ";
is ordinal-digit(65, :u), "65ᵗʰ", "65 is 65ᵗʰ";
is ordinal-digit(70, :u), "70ᵗʰ", "70 is 70ᵗʰ";
is ordinal-digit(76, :u), "76ᵗʰ", "76 is 76ᵗʰ";
is ordinal-digit(80, :u), "80ᵗʰ", "80 is 80ᵗʰ";
is ordinal-digit(87, :u), "87ᵗʰ", "87 is 87ᵗʰ";
is ordinal-digit(90, :u), "90ᵗʰ", "90 is 90ᵗʰ";
is ordinal-digit(98, :u), "98ᵗʰ", "98 is 98ᵗʰ";
is ordinal-digit(99, :u), "99ᵗʰ", "99 is 99ᵗʰ";

is ordinal-digit(100, :u), "100ᵗʰ", "100 is 100ᵗʰ";
is ordinal-digit(101, :u), "101ˢᵗ", "101 is 101ˢᵗ";
is ordinal-digit(102, :u), "102ⁿᵈ", "102 is 102ⁿᵈ";
is ordinal-digit(103, :u), "103ʳᵈ", "103 is 103ʳᵈ";
is ordinal-digit(104, :u), "104ᵗʰ", "104 is 104ᵗʰ";
is ordinal-digit(105, :u), "105ᵗʰ", "105 is 105ᵗʰ";
is ordinal-digit(106, :u), "106ᵗʰ", "106 is 106ᵗʰ";
is ordinal-digit(107, :u), "107ᵗʰ", "107 is 107ᵗʰ";
is ordinal-digit(108, :u), "108ᵗʰ", "108 is 108ᵗʰ";
is ordinal-digit(109, :u), "109ᵗʰ", "109 is 109ᵗʰ";

is ordinal-digit(110, :u), "110ᵗʰ", "110 is 110ᵗʰ";
is ordinal-digit(111, :u), "111ᵗʰ", "111 is 111ᵗʰ";
is ordinal-digit(112, :u), "112ᵗʰ", "112 is 112ᵗʰ";
is ordinal-digit(113, :u), "113ᵗʰ", "113 is 113ᵗʰ";
is ordinal-digit(114, :u), "114ᵗʰ", "114 is 114ᵗʰ";

is ordinal-digit(-1, :u), "-1ˢᵗ", "-1 is -1ˢᵗ";
is ordinal-digit(-2, :u), "-2ⁿᵈ", "-2 is -2ⁿᵈ";
is ordinal-digit(-3, :u), "-3ʳᵈ", "-3 is -3ʳᵈ";
is ordinal-digit(-10, :u), "-10ᵗʰ", "-10 is -10ᵗʰ";
is ordinal-digit(-11, :u), "-11ᵗʰ", "-11 is -11ᵗʰ";
is ordinal-digit(-12, :u), "-12ᵗʰ", "-12 is -12ᵗʰ";
is ordinal-digit(-13, :u), "-13ᵗʰ", "-13 is -13ᵗʰ";
is ordinal-digit(-14, :u), "-14ᵗʰ", "-14 is -14ᵗʰ";
is ordinal-digit(-15, :u), "-15ᵗʰ", "-15 is -15ᵗʰ";
is ordinal-digit(-40, :u), "-40ᵗʰ", "-40 is -40ᵗʰ";
is ordinal-digit(-50, :u), "-50ᵗʰ", "-50 is -50ᵗʰ";
is ordinal-digit(-90, :u), "-90ᵗʰ", "-90 is -90ᵗʰ";
is ordinal-digit(-123, :u), "-123ʳᵈ", "-123 is -123ʳᵈ";

done-testing;
