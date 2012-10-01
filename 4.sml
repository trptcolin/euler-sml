(*
 * A palindromic number reads the same both ways. The largest palindrome made
 * from the product of two 2-digit numbers is 9009 = 91 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers.
 *)

use "lazy_utils.sml";

fun isPalindrome n =
  let
    val digits = explode(Int.toString(n));
  in
    digits = rev(digits)
  end;

fun lazy iterate f x =
  Cons(x, (iterate f)(f x));

fun rangeUp a b =
  (takeWhile (fn x => x < b)) (iterate (fn x => x + 1) a);

fun rangeDown a b =
  (takeWhile (fn x => x > b)) (iterate (fn x => x - 1) a);

fun allProducts xs ys =
  map (fn x:int => (map (fn y => x * y) ys)) xs;

allProducts (rangeDown 10 1) (rangeDown 10 1);

fun largestProducts xs ys =
  map (fn nil => (valOf Int.minInt)
        | x::xs => x)
    (map (List.filter isPalindrome) (allProducts xs ys));

val answer =
  (foldl Int.max (valOf Int.minInt))
    (largestProducts (rangeDown 999 100) (rangeDown 999 100));

