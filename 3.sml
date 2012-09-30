(*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * What is the largest prime factor of the number 600851475143 ?
 *)

fun divides a b = (a mod b = valOf(IntInf.fromString("0")));

fun primeFactors n =
  let
    fun primesStartingAt i n =
      if n = i then [n]
      else
        if divides n i then i::primesStartingAt i (n div i)
        else primesStartingAt(i + 1) n;
  in
    primesStartingAt(valOf(IntInf.fromString("2"))) n
  end;

primeFactors 2 = [2] andalso
primeFactors 3 = [3] andalso
primeFactors 4 = [2,2] andalso
primeFactors 5 = [5] andalso
primeFactors 6 = [2, 3] andalso
primeFactors 8 = [2, 2, 2] andalso
primeFactors(2*3*5*11) = [2, 3, 5, 11];


fun last(x::nil) = x
  | last(x::xs) = last xs;

val answer =
  last(primeFactors(valOf(IntInf.fromString("600851475143"))));
