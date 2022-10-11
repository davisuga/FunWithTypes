const id = <T>(arg: T): T => arg;
const reproduceBug = () => {
  interface Vehicle {
    color: string;
  }
  interface Car {
    color: string;
    vrummm: () => number;
  }

  class Person {
    go(_: Vehicle) {}
  }
  class UberPerson extends Person {
    go(x: Car) {
      x.vrummm();
    }
  }

  let Bike: Vehicle = { color: "Blue" };
  let John = new UberPerson();
  let JohnJr: Person = John;
  JohnJr.go(Bike); // crashes
};

function absurd<T>(): T {
  let r = JSON.parse("");
  return r;
}

function absurd2<T>(): T {
  let r: any;
  return r;
}

function absurd3<T>(): T {
  const r = {};
  return r as T;
}

function absurd4<T>(): T {
  const r = [][0];
  // @ts-expect-error only throws with noUncheckedIndexedAccess:true
  return r;
}
export {};

let  a = NaN