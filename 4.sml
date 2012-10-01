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

fun rangeUp a b =
  (takeWhile (fn x => x < b)) (iterate (fn x => x + 1) a);

fun rangeDown a b =
  (takeWhile (fn x => x > b)) (iterate (fn x => x - 1) a);

fun comprehend f xs ys =
  map (fn x => map (f x) ys) xs;

fun allProducts xs ys =
  comprehend (fn x => fn y => x * y) xs ys;

allProducts (rangeDown 10 1) (rangeDown 10 1);

fun largestProducts xs ys =
  map (fn nil => (valOf Int.minInt)
        | x::xs => x)
    (map (List.filter isPalindrome) (allProducts xs ys));

val answer =
  (foldl Int.max (valOf Int.minInt))
    (largestProducts (rangeDown 999 100) (rangeDown 999 100));

