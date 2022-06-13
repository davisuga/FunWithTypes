module type Kind1Module = sig
  type 'a t
end

module Tree (F : Kind1Module) = struct
  type 'a tree = Leaf of 'a | Node of 'a tree F.t
end

module RoseTree = Tree (struct
  type 'a t = 'a list
end)

module BinTree = Tree (struct
  type 'a t = 'a * 'a
end)

module AnnTree = Tree (struct
  type 'a t = string * 'a * 'a
end)

(* module RoseTree : sig type 'a t = Leaf of 'a | Node of 'a t list end
   module BinTree : sig type 'a t = Leaf of 'a | Node of ('a t * 'a t) end
   module AnnTree : sig type 'a t = Leaf of 'a | Node of (string * 'a t * 'a t) end *)
module type Monoid = sig
  type t

  val e : t
  val concat : t -> t -> t
end

module Integers = struct
  type t = int

  let e = 0
  let concat = ( + )
  
end

let fold (type a) (module M : Monoid with type t = a) ls =
  List.fold_left M.concat M.e ls

let _ = fold (module Integers) [ 1; 2 ]

let mconcat (type a) (module M : Monoid with type t = a) y x = M.concat y x

(* module type GROUP = sig
  type t

  val zero : t
  val add : t -> t -> t
  val neg : t -> t
end

module type RING = sig
  include GROUP

  val one : t
  val mul : t -> t -> t
end

module type FIELD = sig
  include RING

  val inv : t -> t
end

module type VECTOR_SPACE = sig
  module V : GROUP
  module S : FIELD

  type vector = V.t
  type scalar = S.t

  val scale : scalar -> vector -> vector
end

module type NUM = sig
  type t

  val from_int : int -> t
  val ( + ) : t -> t -> t
end

type 'a num_impl = (module NUM with type t = 'a)

module Num_int : NUM with type t = int = struct
  type t = int

  let from_int x = x
  let ( + ) = Stdlib.( + )
end

let num_int = (module Num_int : NUM with type t = int)
(*
   module Num_bool : NUM with type t = bool = struct
     type t = bool

     let from_int = function 0 -> false | _ -> true
     let ( + ) = function true -> fun _ -> true | false -> fun x -> x
   end

   let num_bool = (module Num_bool : NUM with type t = bool) *)

let concat (type a) num ls =
  let module Num = (val num : NUM with type t = a) in
  List.fold_right Num.( + ) ls (Num.from_int 0)

let test_concat = concat num_int [ 1; 2; 3; 4 ] *)
