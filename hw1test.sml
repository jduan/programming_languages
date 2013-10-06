(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw1.sml";

val test10 = is_older((1,2,3),(2,3,4)) = true
val test11 = is_older((1,2,3),(1,2,3)) = false
val test12 = is_older((1,2,3),(1,2,4)) = true
val test13 = is_older((2013, 10, 5),(2013, 10, 6)) = true

val test20 = number_in_month([(2012,2,28),(2013,12,1)],2) = 1
val test21 = number_in_month([(2012,2,28),(2013,2,1)],2) = 2
val test22 = number_in_month([(2012,2,28),(2013,12,1)],12) = 1
val test23 = number_in_month([], 12) = 0

val test30 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test31 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0
val test32 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3]) = 2
val test33 = number_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[1,3,12]) = 2

val test40 = dates_in_month([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test41 = dates_in_month([(2012,2,28),(2013,12,1), (2013,2,10)],2) = [(2012,2,28), (2013,2,10)]
val test42 = dates_in_month([(2013,12,1)],2) = []
val test43 = dates_in_month([(2012,2,28),(2013,12,1)],12) = [(2013,12,1)]

val test50 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test51 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,4]) = [(2012,2,28),(2011,4,28)]
val test52 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[1,3,4]) = [(2011,3,31),(2011,4,28)]
val test53 = dates_in_months([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[12,3,4]) = [(2013,12,1),(2011,3,31),(2011,4,28)]

val test60 = get_nth(["hi", "there", "how", "are", "you"], 2) = "there"
val test61 = get_nth(["hi", "there", "how", "are", "you"], 1) = "hi"
val test62 = get_nth(["hi", "there", "how", "are", "you"], 3) = "how"
val test63 = get_nth(["hi", "there", "how", "are", "you"], 4) = "are"
val test64 = get_nth(["hi", "there", "how", "are", "you"], 5) = "you"

val test70 = date_to_string((2013, 6, 1)) = "June 1, 2013"
val test71 = date_to_string((2013, 4, 2)) = "April 2, 2013"
val test72 = date_to_string((2013, 5, 3)) = "May 3, 2013"
val test73 = date_to_string((2013, 1, 4)) = "January 4, 2013"

val test80 = number_before_reaching_sum(10, [1,2,3,4,5]) = 3
val test81 = number_before_reaching_sum(8, [1,2,3,4,5]) = 3
val test82 = number_before_reaching_sum(11, [1,2,3,4,5]) = 4
val test83 = number_before_reaching_sum(4, [1,2,3,4,5]) = 2

val test90 = what_month(70) = 3
val test91 = what_month(90) = 3
val test92 = what_month(150) = 5
val test93 = what_month(200) = 7
val test94 = what_month(250) = 9
val test95 = what_month(300) = 10

val test100 = month_range(31, 34) = [1,2,2,2]
val test101 = month_range(31, 31) = [1]
val test102 = month_range(31, 30) = []

val test110 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test111 = oldest([]) = NONE
val test112 = oldest([(1012,2,28),(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (1012,2,28)
val test113 = oldest([(2012,2,28),(2011,3,31),(2011,2,28)]) = SOME (2011,2,28)

val test120 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,2,3,4]) = 3
val test121 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = 0
val test122 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[3,2,2,3]) = 2
val test123 = number_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[3,1,12,1,3,12]) = 2

val test130 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[3,4,2,2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test131 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[4,2,2,4,2,4]) = [(2012,2,28),(2011,4,28)]
val test132 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[3,4,1,1,3,4]) = [(2011,3,31),(2011,4,28)]
val test133 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[3,4,12,3,4]) = [(2013,12,1),(2011,3,31),(2011,4,28)]

val test140 = reasonable_date((0,1,1)) = false
val test141 = reasonable_date(~100,1,1) = false
val test142 = reasonable_date(2000,0,1) = false
val test143 = reasonable_date(2000,13,1) = false
val test144 = reasonable_date(2000,5,0) = false
val test145 = reasonable_date(2000,5,32) = false
val test146 = reasonable_date(2000,2,29) = true
val test147 = reasonable_date(2000,2,28) = true
val test148 = reasonable_date(1999,2,28) = true
val test149 = reasonable_date(1999,2,29) = false
val test1410 = reasonable_date(1999,1,31) = true
val test1411 = reasonable_date(1999,1,32) = false
val test1412 = reasonable_date(1999,4,30) = true
val test1413 = reasonable_date(1999,4,31) = false
