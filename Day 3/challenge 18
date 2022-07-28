import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Iter "mo:base/Iter";
import Error "mo:base/Error";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor {
  stable var counter : Nat = 0;
  stable var versionNumber = 0;

  public func increment_counter(n : Nat) : async Nat{
    counter += n;
    return counter;
  };
  public func clear_counter() : async Nat{
    counter := 0;
    return counter;
  };

  system func preupgrade() {
    versionNumber += 1;
  };

  system func postupgrade() {
    Debug.print(debug_show(Nat.toText(versionNumber)));
    //??
  };

};
