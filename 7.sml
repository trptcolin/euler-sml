(* By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
* that the 6th prime is 13.
*
* What is the 10 001st prime number?
*)

use "lazy_utils.sml";

fun divides a b = a mod b = 0;

(* Ok, so this is brute force, slow, and mostly stolen from Robert Harper's book
* Programming in Standard ML, but it's fun how succinct it is*)
fun lazy sieve (Cons (x, s)) =
  Cons (x, sieve (sfilter (fn z => not (divides z x)) s));

val answer = shd(drop 10000 (sieve(stl naturalNumbers)));

