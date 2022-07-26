import Iter "mo:base/Iter";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";

actor {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
  // Challenge 1
  public func add(n : Nat, m: Nat) : async Nat{
    return n + m;
  };
  // Challenge 2
  public func square(n : Nat) : async Nat{
    return n * n;
  };
  // Challenge 3
  public func days_to_second(n : Nat) : async Nat{
    return n * 24 * 60 ** 2;
  };
  // Challenge 4
  var counter = 0;
  public func increment_counter(n : Nat) : async Nat{
    counter += n;
    return counter;
  };
  public func clear_counter() : async Nat{
    counter := 0;
    return counter;
  };
  // Challenge 5
  public func divide(n : Nat, m : Nat) : async Bool{
    if(m == 0){
      return false;
    } else{
      return n % m == 0;
    };
  };
  // Challenge 6
  public func is_even(n : Nat) : async Bool{
    return n % 2 == 0;
  };
  // Challenge 7
  public func sum_of_array(array : [Nat]) : async Nat{
    var sum = 0;
    for(value in array.vals()){
      sum += value;
    };
    return sum;
  };
  // Challenge 8
  public func maximum(array : [Nat]) : async Nat{
    var ans = 0;
    for(value in array.vals()){
      if(value > ans){
        ans := value;
      };
    };
    return ans;
  };
  // Challenge 9
  public func remove_from_array(array : [Nat], n : Nat) : async [Nat]{
    let filter_elements = func (x : Nat) : Bool { x != n };
    var new_array : [Nat] = Array.filter<Nat>(array, filter_elements);
    return new_array;
  };
  // Challenge 10
  public func selection_sort(adwdsanwd skajw) : async [Nat]{
    var new_array = Array.thaw<Nat>(array);
    var n = new_array.size();
    for (i in Iter.range(0, n - 2)){
      var min = i;
      for(j in Iter.range(i + 1, n - 1)){
        if(new_array[j] < new_array[min]){
          min := j;
        };
      };
      if (min != i){
        var tmp = new_array[i];
        new_array[i] := new_array[min];
        new_array[min] := tmp;
      };
    };
    return (Array.freeze<Nat>(new_array));
  };
  // Additioal functions
  // sort
  public func sort(arr:[Nat]): async [Nat]{
      return Array.sort<Nat>(arr, func(a,b){Nat.compare(a,b)});
    };
};
