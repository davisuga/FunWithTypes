// TypeScript currently doesn't support higher kinded types, but there is a proposal for something like this:
// interface Database<P<~> extends PromiseLike<~>>> {
//   query<T>(s:string, args:any[]):P<T>
// }

// type Monad<T, A> = {
//   map<U>(f: (x: T<_>) => U): Monad<U>
// }

type Kind1Module<T> = {
  t: T;
};

type tree<a> =
  | {
      _tag: "leaf";
      t: a;
    }
  | {
      _tag: "node";
      t: Kind1Module<tree<a>>;
    };

type Tree<F> = {
  tree: tree<F>;
};
type _ = Tree<string>;
export {};
// // type SetVerify = <T>(x: T) => boolean;
// // type x = S<S>
// // let justSelf = <T>(x: T) => justSelf === x;

// // let empty = <T>(x: T) => false;

// // let russel = (s: SetVerify) => !s(s);
