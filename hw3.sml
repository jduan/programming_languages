(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let
	val r = g f1 f2
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

fun only_capitals(xs) =
  List.filter (fn str => Char.isUpper(String.sub(str, 0))) xs

fun longest_string1(xs) =
  foldl(fn (x, acc) => if String.size(x) > String.size(acc) then x else acc) "" xs

fun longest_string2(xs) =
  foldl(fn (x, acc) => if String.size(x) >= String.size(acc) then x else acc) "" xs

fun longest_string_helper f xs =
  foldl(fn (x, acc) => if f(String.size(x), String.size(acc)) then x else acc) "" xs

val longest_string3 = fn xs => longest_string_helper (fn (x, y) => x > y) xs

val longest_string4 = fn xs => longest_string_helper (fn (x, y) => x >= y) xs

fun longest_capitalized xs = (longest_string1 o only_capitals) xs

val rev_string = implode o List.rev o explode

fun first_answer f xs =
  case List.find(fn x => isSome(f x)) xs of
       SOME x => x
     | NONE => raise NoAnswer

fun all_answers f xs=
  foldl(fn (x, acc) => case f x of
                           SOME lst1 => (case acc of
                                          SOME lst2 => SOME(lst2 @ lst1)
                                        | NONE => NONE)
                          | NONE => NONE)
                          (SOME []) xs


fun count_wildcards p = g (fn () => 1) (fn x => 0) p

fun count_wild_and_variable_lengths p = g (fn () => 1) String.size p

fun count_some_var(s, p) = g (fn () => 0) (fn s2 => if s = s2 then 1 else 0) p

fun check_pat p =
let
  fun find_strings p =
    case p of
         Variable x        => [x]
       | TupleP ps         => List.foldl (fn (p,acc) => (find_strings p) @ acc) [] ps
       | ConstructorP(_,p) => find_strings p
       | _                 => []

  fun all_distinct xs =
    not (List.exists (fn x => (length (List.filter (fn y => x = y) xs)) > 1) xs)
in
  all_distinct (find_strings p)
end

(*fun match(v, p) =*)
(*let*)
(*  fun tuple_match(vs, ps) =*)
(*    all_answers(fn pair => case match(#1 pair, #2 pair) of*)
(*                                NONE => NONE*)
(*                              | SOME l => SOME l) ListPair.zip(vs, ps)*)
(*in*)
(*  case p of*)
(*       Wildcard => SOME []*)
(*     | Variable s => SOME [(s, v)]*)
(*     | UnitP => (case v of*)
(*                     Unit => SOME []*)
(*                   | _ => NONE)*)
(*     | ConstP i => (case v of*)
(*                         Const j => if i = j then SOME [] else NONE*)
(*                       | _ => NONE)*)
(*     | TupleP ps => (case v of*)
(*                          Tuple vs => let val tm = tuple_match(vs, ps) in*)
(*                            if length vs = length ps andalso isSome tm*)
(*                            then tm else NONE*)
(*                                      end*)
(*                        | _ => NONE)*)
(*     | ConstructorP (s, p) => (case v of*)
(*                                     Constructor (s', v) => let val m = match(v, p) in*)
(*                                       if s = s' andalso m then m else NONE*)
(*                                                             end*)
(*                                   | _ => NONE)*)
(*end*)

(*fun first_match v, ps =*)
(*  first_answer (fn p => match(v, p)) ps handle NoAnswer => NONE*)

(*val test70 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4*)

(*
datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let
	val r = g f1 f2
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end
 *)
