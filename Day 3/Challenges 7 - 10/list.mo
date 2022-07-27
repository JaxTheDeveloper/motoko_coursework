//import Array "mo:base/Array";
//import Iter "mo:base/Iter";

actor {

  public type List<T> = ?(T, List<T>);

  func is_list_null<T>(I : List<T>) : Bool {
    switch I {
      case null { true  };
      case (?l) { false };
    };
  };

  func last<T>(I : List<T>) : ?T {
    switch I {
      case null { null };
      case (?(x, null)) { ?x };
      case (?(_, t)) { last<T>(t) };
    }
  };

  func size<T>(I : List<T>) : Nat {
    func record(I : List<T>, n : Nat) : Nat {
      switch I {
        case null { return n };
        case (?(_, t)) { record(t, n + 1) };
      }
    };
    record(I,0)
  };

  func get<T>(I : List<T>, n : Nat) : ?T {
    switch (n, I) {
      case (_, null) { null };
      case (0, (?(h, t))) { ?h };
      case (_, (?(_, t))) { get<T>(t, n - 1) };
    };
  };

};
