(* The sum of the squares of the first ten natural numbers is,
*
* 12 + 22 + ... + 102 = 385
* The square of the sum of the first ten natural numbers is,
*
* (1 + 2 + ... + 10)2 = 552 = 3025
* Hence the difference between the sum of the squares of the first ten natural
* numbers and the square of the sum is 3025  385 = 2640.
*
* Find the difference between the sum of the squares of the first one hundred
* natural numbers and the square of the sum.
*)

use "lazy_utils.sml";

fun squareOfSum n =
let
  val sum = foldl (op +) 0 (take n naturalNumbers);
in
  sum * sum
end;

fun sumOfSquares n =
let
  val squares = map (fn x => x * x) (take n naturalNumbers);
in
  foldl (op +) 0 squares
end;

val answer = sumOfSquares(100) - squareOfSum(100);

