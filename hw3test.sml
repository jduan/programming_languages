(* Homework3 Simple Test*)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw3.sml";

val test10 = only_capitals ["A","B","C"] = ["A","B","C"]
val test11 = only_capitals ["B","C"] = ["B","C"]
val test12 = only_capitals [] = []
val test13 = only_capitals ["abcA","Bca","C"] = ["Bca","C"]
val test14 = only_capitals ["abcA","bca","c"] = []

val test20 = longest_string1 ["A","bc","C"] = "bc"
val test21 = longest_string1 [] = ""
val test22 = longest_string1 ["AB","bc","C"] = "AB"
val test23 = longest_string1 ["A","bc","Cba"] = "Cba"

val test30 = longest_string2 ["A","bc","C"] = "bc"
val test31 = longest_string2 [] = ""
val test32 = longest_string2 ["AB","bc","C"] = "bc"
val test33 = longest_string2 ["A","bc","Cba"] = "Cba"

val test4a= longest_string3 ["A","bc","C"] = "bc"
val test40 = longest_string1 ["A","bc","C"] = "bc"
val test41 = longest_string1 [] = ""
val test42 = longest_string1 ["AB","bc","C"] = "AB"
val test43 = longest_string1 ["A","bc","Cba"] = "Cba"

val test4b= longest_string4 ["A","B","C"] = "C"
val test44 = longest_string2 ["A","bc","C"] = "bc"
val test45 = longest_string2 [] = ""
val test46 = longest_string2 ["AB","bc","C"] = "bc"
val test47 = longest_string2 ["A","bc","Cba"] = "Cba"

val test50 = longest_capitalized ["A","bc","C"] = "A";
val test51 = longest_capitalized [] = ""
val test52 = longest_capitalized ["AB","bc","C"] = "AB"
val test53 = longest_capitalized ["A","bc","Cba"] = "Cba"
val test54 = longest_capitalized ["AB","Bk","C"] = "AB"

val test60 = rev_string "abc" = "cba";
val test61 = rev_string "" = "";
val test62 = rev_string "hello" = "olleh";

val test70 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test71 = (first_answer (fn x => if x > 7 then SOME x else NONE) [1,2,3,4,5] handle NoAnswer => 7) = 7

val test80 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test81 = all_answers (fn x => if x = 3 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test82 = all_answers (fn x => if x > 0 then SOME [x] else NONE) [2,3,4,5,6,7] = SOME [2,3,4,5,6,7]
val test83 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [] = SOME []

val test9a0 = count_wildcards Wildcard = 1
val test9a1 = count_wildcards (Variable("hello")) = 0
val test9a2 = count_wildcards UnitP = 0
val test9a3 = count_wildcards (ConstP(3)) = 0
val test9a4 = count_wildcards (TupleP([Wildcard, UnitP])) = 1
val test9a5 = count_wildcards (TupleP([Wildcard, UnitP, Wildcard])) = 2
val test9a6 = count_wildcards (ConstructorP("helo", Wildcard)) = 1
val test9a7 = count_wildcards (ConstructorP("helo", (TupleP([Wildcard, UnitP, Wildcard])))) = 2

val test9b0 = count_wild_and_variable_lengths (Variable("a")) = 1
val test9b1 = count_wild_and_variable_lengths (Variable("hello")) = 5
val test9b2 = count_wild_and_variable_lengths UnitP = 0
val test9b3 = count_wild_and_variable_lengths (ConstP(3)) = 0
val test9b4 = count_wild_and_variable_lengths (TupleP([Wildcard, UnitP])) = 1
val test9b5 = count_wild_and_variable_lengths (TupleP([Wildcard, UnitP, Wildcard, Variable("hello")])) = 7
val test9b6 = count_wild_and_variable_lengths (ConstructorP("helo", Wildcard)) = 1
val test9b7 = count_wild_and_variable_lengths (ConstructorP("helo", (TupleP([Wildcard, UnitP, Wildcard])))) = 2

val test9c0 = count_some_var ("x", Variable("x")) = 1
val test9c1 = count_some_var ("b", Variable("a")) = 0
val test9c2 = count_some_var ("hello", Variable("hello")) = 1
val test9c3 = count_some_var ("hello", UnitP) = 0
val test9c4 = count_some_var ("x", ConstP(3)) = 0
val test9c5 = count_some_var ("x", TupleP([Wildcard, UnitP])) = 0
val test9c6 = count_some_var ("hello", TupleP([Wildcard, UnitP, Wildcard, Variable("hello")])) = 1
val test9c7 = count_some_var ("hello", ConstructorP("hello", Wildcard)) = 0
val test9c8 = count_some_var ("hello", ConstructorP("hello", (TupleP([Wildcard, UnitP, Variable("hello")])))) = 1

val test100 = check_pat (Variable("x")) = true
val test101 = check_pat (UnitP) = true
val test102 = check_pat Wildcard = true
val test103 = check_pat (Variable("hello")) = true
val test105 = check_pat (ConstP(3)) = true
val test106 = check_pat (TupleP([Wildcard, UnitP])) = true
val test107 = check_pat (TupleP([Wildcard, UnitP, Wildcard])) = true
val test108 = check_pat (ConstructorP("helo", Wildcard)) = true
val test109 = check_pat (ConstructorP("helo", (TupleP([Wildcard, UnitP, Wildcard])))) = true
val test110 = check_pat (ConstructorP("helo", (TupleP([Wildcard, Variable("world"), Wildcard])))) = true
val test111 = check_pat (ConstructorP("helo", (TupleP([Variable("hello"), Variable("world"), Wildcard])))) = true
val test112 = check_pat (ConstructorP("helo", (TupleP([Variable("hello"), Variable("hello"), Wildcard])))) = false

(*val test110 = match (Const(1), UnitP) = NONE*)

(*val test12 = first_match Unit [UnitP] = SOME []*)

