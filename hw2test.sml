(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "hw2.sml";

val test10 = all_except_option("string", ["string"]) = SOME []
val test11 = all_except_option("string", []) = NONE
val test12 = all_except_option("string", ["hello"]) = NONE
val test13 = all_except_option("string", ["hello", "string"]) = SOME ["hello"]
val test14 = all_except_option("string", ["hello", "string", "world"]) = SOME ["hello", "world"]

val test20 = get_substitutions1([["foo"],["there"]], "foo") = []
val test21 = get_substitutions1([["foo", "bar"],["there"]], "foo") = ["bar"]
val test22 = get_substitutions1([["hello", "world", "foo"], ["foo", "bar"],["there"]], "foo") = ["hello", "world", "bar"]
val test23 = get_substitutions1([], "foo") = []
val test24 = get_substitutions1([["hello", "world", "foo"], ["hello", "foo", "bar"],["there"]], "foo") = ["hello", "world", "hello", "bar"]

val test30 = get_substitutions2([["foo"],["there"]], "foo") = []
val test31 = get_substitutions2([["foo", "bar"],["there"]], "foo") = ["bar"]
val test32 = get_substitutions2([["hello", "world", "foo"], ["foo", "bar"],["there"]], "foo") = ["hello", "world", "bar"]
val test33 = get_substitutions2([], "foo") = []
val test34 = get_substitutions2([["hello", "world", "foo"], ["hello", "foo", "bar"],["there"]], "foo") = ["hello", "world", "hello", "bar"]

val test40 = similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
        [{first="Fred", last="Smith", middle="W"}, {first="Fredrick", last="Smith", middle="W"},
         {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith",
         middle="W"}];
val test41 = similar_names([["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
        [{first="Fred", last="Smith", middle="W"},
         {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith",
         middle="W"}];
val test42 = similar_names([["Fred", "F2"], ["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
        [{first="Fred", last="Smith", middle="W"},
        {first="F2", last="Smith", middle="W"},
        {first="Fredrick", last="Smith", middle="W"},
         {first="Freddie", last="Smith", middle="W"}, {first="F", last="Smith",
         middle="W"}];
val test43 = similar_names([], {first="Fred", middle="W", last="Smith"}) =
        [{first="Fred", last="Smith", middle="W"}];

val test50 = card_color((Clubs, Num 2)) = Black
val test51 = card_color((Spades, Num 3)) = Black
val test52 = card_color((Diamonds, Num 4)) = Red
val test53 = card_color((Hearts, Num 5)) = Red

val test600 = card_value((Clubs, Num  2)) =  2
val test601 = card_value((Clubs, Num  3)) =  3
val test602 = card_value((Clubs, Num  4)) =  4
val test603 = card_value((Clubs, Num  5)) =  5
val test604 = card_value((Clubs, Num  6)) =  6
val test605 = card_value((Clubs, Num  7)) =  7
val test606 = card_value((Clubs, Num  8)) =  8
val test607 = card_value((Clubs, Num  9)) =  9
val test608 = card_value((Clubs, Num 10)) = 10
val test609 = card_value((Clubs, Jack)) = 10
val test610 = card_value((Clubs, Queen)) = 10
val test611 = card_value((Clubs, King)) = 10
val test612 = card_value((Clubs, Ace)) = 11
(*suits d13n't matter*)
val test614 = card_value((Clubs, Num 10)) = 10
val test615 = card_value((Spades, Jack)) = 10
val test616 = card_value((Diamonds, Queen)) = 10
val test617 = card_value((Hearts, King)) = 10
val test618 = card_value((Spades, Ace)) = 11

val test70 = remove_card([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val test71 = (remove_card([], (Hearts, Ace), IllegalMove) handle IllegalMove => []) = []
val test72 = remove_card([(Hearts, Ace), (Diamonds, Jack)], (Hearts, Ace), IllegalMove) = [(Diamonds, Jack)]
val test73 = remove_card([(Spades, Queen), (Hearts, Ace), (Diamonds, Jack)],
(Hearts, Ace), IllegalMove) = [(Spades, Queen), (Diamonds, Jack)]

val test80 = all_same_color([(Hearts, Ace), (Hearts, Ace)]) = true
val test81 = all_same_color([(Spades, Ace), (Hearts, Ace)]) = false
val test82 = all_same_color([]) = true
val test83 = all_same_color([(Hearts, Ace)]) = true
val test84 = all_same_color([(Diamonds, Queen), (Hearts, Ace), (Hearts, Ace)]) = true
val test85 = all_same_color([(Hearts, Ace), (Hearts, Ace), (Clubs, Num 2)]) = false

val test90 = sum_cards([]) = 0
val test91 = sum_cards([(Clubs, Num 4),(Clubs, Num 2)]) = 6
val test92 = sum_cards([(Clubs, Ace),(Clubs, Num 2)]) = 13
val test93 = sum_cards([(Clubs, Queen),(Clubs, Num 2)]) = 12
val test94 = sum_cards([(Clubs, Num 2)]) = 2

val test100 = score([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val test101 = score([(Hearts, Num 8),(Clubs, Num 4)],10) = 6
val test102 = score([(Spades, Num 8),(Clubs, Num 4)],10) = 3
val test103 = score([(Spades, Num 9),(Clubs, Num 4)],10) = 4

val test110 = officiate([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test111 = officiate([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                       [Draw,Draw,Draw,Draw,Draw],
                       42)
             = 3

val test112 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false)
              handle IllegalMove => true)

val test113 = officiate([(Hearts, Num 2),(Clubs, Num 4)],[], 15) = 7

val test114 = officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Draw, Discard(Spades,Num 8)],
                         42) = 16;

val test115 = officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Draw,Draw, Draw],
                         42) = 12;

val test116 = officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Draw,Draw, Draw],
                         12) = 9;
