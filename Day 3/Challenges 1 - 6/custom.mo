module {
  public type condition = {#mint; #slightly_used; #used; #fair; #worse_than_dog_water};

  public type PrivateJet = {
    fuel : Nat;
    hours_flown : Nat;
    market_price : Nat;
    isOperational : condition;
  };
};