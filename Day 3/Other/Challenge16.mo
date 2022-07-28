import Cycles "mo:base/ExperimentalCycles";

actor Echo {

  public func deposit_cycles() : async Nat {
    let available = Cycles.available();
    return Cycles.accept(available);
  };

  public func get_cycles_amount() : async Nat {
    return Cycles.balance();
  };

  //challenge 17: not (yet) implemented

};
