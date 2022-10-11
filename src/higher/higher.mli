module type Kind1Module = sig type 'a t end
module Tree :
  functor (F : Kind1Module) ->
    sig type 'a tree = Leaf of 'a | Node of 'a tree F.t end
module RoseTree : sig type 'a tree = Leaf of 'a | Node of 'a tree list end
module BinTree :
  sig type 'a tree = Leaf of 'a | Node of ('a tree * 'a tree) end
module AnnTree :
  sig type 'a tree = Leaf of 'a | Node of (string * 'a tree * 'a tree) end
module type Monoid = sig type t val e : t val concat : t -> t -> t end
module Integers :
  sig type t = int val e : int val concat : int -> int -> int end
val fold : (module Monoid with type t = 'a) -> 'a list -> 'a
val mconcat : (module Monoid with type t = 'a) -> 'a -> 'a -> 'a

