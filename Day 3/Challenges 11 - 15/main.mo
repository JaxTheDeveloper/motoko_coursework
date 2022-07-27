import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Iter "mo:base/Iter";
import Error "mo:base/Error";

actor {

  let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

  public shared(msg) func is_anonymous() : async Bool {
      if (msg.caller == Principal.fromText("2vxsx-fae")) {return true};
      return false;
  };

  public shared(msg) func add_favorite_number(n : Nat) : async Text {
    switch (favoriteNumber.get(msg.caller)) {
      case null {
        favoriteNumber.put(msg.caller, n);
        return ("You've successfully registered your number");
      };
      case (_) {
        return ("You've already registered your number");
      }
    };
  };

  public shared(msg) func show_favorite_number() : async ?Nat {
    return (favoriteNumber.get(msg.caller));
  };

  public shared(msg) func update_favorite_number(n : Nat) : async () {
    switch (favoriteNumber.get(msg.caller)) {
      case null {
        throw Error.reject("\nYou did not register a number, how are we supposed to update?");
      };
      case (_) {
        favoriteNumber.put(msg.caller, n);
      };
    };
  };

  public shared(msg) func delete_favorite_number() : async ?Nat {
    switch (favoriteNumber.get(msg.caller)) {
      case null {
        throw Error.reject("\nYou did not register a number, how are we supposed to delete?");
      };
      case (_) {
        favoriteNumber.remove(msg.caller);
      };
    };
  }

};
