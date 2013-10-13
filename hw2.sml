(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

fun all_except_option(s, xs) =
  case xs of
       [] => NONE
     | x::xs' =>
         if same_string(s, x)
         then SOME xs'
         else
           case all_except_option(s, xs') of
                NONE => NONE
              | SOME xs'' => SOME(x :: xs'')

fun get_substitutions1(xss, s) =
  case xss of
       [] => []
     | xs::xss' =>
         case all_except_option(s, xs) of
              NONE => get_substitutions1(xss', s)
            | SOME lst => lst @ get_substitutions1(xss', s)

fun get_substitutions2(xss, s) =
let
  fun aux(xss, s, acc) =
    case xss of
         [] => acc
       | xs::xss' =>
           case all_except_option(s, xs) of
                NONE => aux(xss', s, acc)
              | SOME lst => aux(xss', s, acc @ lst)
in
  aux(xss, s, [])
end

fun similar_names(xss, fullname) =
let
  val {first=f, middle=m, last=l} = fullname
  fun aux(lst) =
    case lst of
         [] => []
       | x::xs => {first=x, middle=m, last=l} :: aux(xs)
  fun similar_names_helper(xss) =
    case xss of
         [] => []
       | xs::xss' =>
           case all_except_option(f, xs) of
                NONE => similar_names_helper(xss')
              | SOME lst => aux(lst) @ similar_names_helper(xss')
in
  fullname :: similar_names_helper(xss)
end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

(* put your solutions for problem 2 here *)

fun card_color(suit, rank) =
  case suit of
       Clubs => Black
     | Spades => Black
     | Diamonds => Red
     | Hearts => Red

fun card_value(suit, rank) =
  case rank of
       Jack => 10
     | Queen => 10
     | King => 10
     | Ace => 11
     | Num i => i

fun remove_card(cs, c, e) =
  case cs of
       [] => raise e
     | card::cs' =>
         if card = c
         then cs'
         else card :: remove_card(cs', c, e)

fun all_same_color(cs) =
  case cs of
       [] => true
     | c::[] => true
     | c1::c2::cs' =>
         if card_color c1 = card_color c2
         then all_same_color(c2::cs')
         else false

fun sum_cards cs =
let
  fun aux(cs, acc) =
    case cs of
         [] => acc
       | c::cs' => aux(cs', card_value c + acc)
in
  aux(cs, 0)
end

fun score(cs, goal) =
let
  val sum = sum_cards cs
  val preliminary =
    if sum > goal then
      3 * (sum - goal)
    else
      goal - sum
in
  if all_same_color(cs)
  then preliminary div 2
  else preliminary
end

fun officiate(cards, moves, goal) =
let
  fun aux(cards, moves, goal, helds) =
    case moves of
         [] => helds
       | move::moves' =>
           case move of
                Discard card => aux(cards, moves', goal, remove_card(helds, card, IllegalMove))
              | Draw =>
                  case cards of
                       [] => helds
                     | card::cards' =>
                         if sum_cards(card::helds) > goal
                         then card::helds
                         else aux(cards', moves', goal, card::helds)
  val helds = aux(cards, moves, goal, [])
in
  score(helds, goal)
end
