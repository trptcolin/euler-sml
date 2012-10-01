(* most lazy details are from Programming in Standard ML, Robert Harper
 * notable exception: Compiler.Control.Lazy.enabled has moved to Control.lazysml *)
Control.lazysml := true;
open Lazy;
datatype lazy 'a stream = Cons of 'a * 'a stream;

fun shd(Cons(h,_)) = h;
fun stl(Cons(_,t)) = t;
fun lazy lstl(Cons(_,t)) = t;

fun smap f =
  let
    fun lazy loop (Cons(x, s)) =
      Cons(f x, loop s)
  in
    loop
  end;

val rec lazy naturalNumbers = Cons(1, smap (fn x => x+1) naturalNumbers);

fun sfilter f =
  let
    fun lazy loop (Cons(x, s)) =
      if f x then Cons(x, loop s)
      else loop s
  in
    loop
  end;

fun take 0 _ : 'a list = nil
  | take n (Cons(x,s)) = x :: take (n-1) s;

fun takeWhile f (Cons(x,xs)): 'a list =
  if f x then x :: takeWhile f xs
  else nil;

fun drop 0 s : 'a stream = s
  | drop n (Cons(x,s)) = drop (n-1) s;

fun dropWhile f (Cons(x,xs)): 'a stream =
  if f x then dropWhile f xs
  else Cons(x, xs);

fun lazy iterate f x =
  Cons(x, iterate(f)(f x));

