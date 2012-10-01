(* 2520 is the smallest number that can be divided by each of the numbers from 1
 * to 10 without any remainder.
 *
 * What is the smallest positive number that is evenly divisible by all of the
 * numbers from 1 to 20?
 *)

val answer = 19 * 17 * 13 * 11 * 7 * 5 * 3 * 2 *
             8 (* gets to 4,8,12,16,20 *)
             * 3 (* gets to 9,18 *);
