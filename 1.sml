(*
 * If we list all the natural numbers below 10 that are multiples of 3 or 5, we
 * get 3, 5, 6 and 9. The sum of these multiples is 23.
 *
 * Find the sum of all the multiples of 3 or 5 below 1000.
*)

use "lazy_utils.sml";

fun sum(xs) = foldl op + 0 xs;

fun divides a b = (a mod b = 0);

fun dividesEither(a, b) =
  sfilter (fn x => (divides x a orelse divides x b));

(* Note: currently paying the price of holding all the (divisible) numbers in
 * memory, since there's not a fold that works on streams *)
fun upto(limit) = takeWhile (fn x => x < limit);

val answer =
  sum (upto(1000) (dividesEither(3, 5) naturalNumbers));

