import Debug "mo:base/Debug";
import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";
import Cycles "mo:base/ExperimentalCycles";
import Trie "mo:base/Trie";
import Nat "mo:base/Nat";
import Hash "mo:base/Hash";
import Types "types";
import Iter "mo:base/Iter";

actor {
  //variable declaration
  public type Customer = Types.Customer;
  var customers : HashMap.HashMap<Nat, ?Customer> = HashMap.HashMap(0, Nat.equal, Hash.hash);
  stable var next : Nat = 0;
  stable var currentPrincipalID = "";
  stable var walletEntries : [(Nat, ?Customer)] = [];

  //placeholder function to get wallet principal ID
  public func instantiate(PrincipalID : Text) : () {
    currentPrincipalID := PrincipalID;
  };
  
  //account creation
  public func createAccount(Name_ : Text, Birthday_ : Text, Phone_ : Text, Sex_ : Bool) : async Bool {
    let currentaccount : Customer = {
      Name = Name_;
      Birthday = Birthday_;
      Phone = Phone_;
      Sex = Sex_;
    };
    customers.put(next, ?currentaccount);
    next += 1;
    return true;
  };

  //account update
  public func update_account(id : Nat, Name_ : Text, Birthday_ : Text, Phone_ : Text, Sex_ : Bool) : async Bool {
    switch (customers.get(id)){
      case(null) {
        Debug.print(debug_show(Nat.toText(id)));
        return false;
      };
      case (?customer) {
        let currentaccount : Customer = {
          Name = Name_;
          Birthday = Birthday_;
          Phone = Phone_;
          Sex = Sex_;
        };
        customers.put(next, ?currentaccount);
        return true;
      };
    };
  };

  //accound deletion (basically set the customer to null)
  public func delete_account(id : Nat) : async Bool {
    switch (customers.get(id)){
      case(null) {
        return false;
      };
      case (?customer) {
        customers.put(next, null);
        return true;
      };
    }
  };

  //debug function
  public func view_all_entries() : async [(Nat, ?Customer)] {
    return Iter.toArray(customers.entries());
  };

  //entry viewer
  public func view_entry(id : Nat) : async [(Nat, ?Customer)] {
    switch (customers.get(id)) {
      case (null) {
        let resultlist : [(Nat, ?Customer)] = [(id, null)];
        return resultlist;
      };
      case (?value) {
        let resultlist : [(Nat, ?Customer)] = [(id, value)];
      }
    };
  };

  //makeshift method to make customers collection stable
  system func preupgrade() {
    walletEntries := Iter.toArray(customers.entries());
  };

  system func postupgrade() {
    customers := HashMap.fromIter<Nat, ?Customer>(walletEntries.vals(), 1, Nat.equal, Hash.hash);
  };

};
