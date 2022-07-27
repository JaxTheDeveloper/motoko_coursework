import Custom "custom";
import Animal "animal";
import List "mo:base/List";
import Array "mo:base/Array"

actor {

  public type PrivateJet = Custom.PrivateJet;
  public type condition = Custom.condition;
  public type Animal = Animal.Animal;

  var animals = List.nil<Animal>();

  let an_animal : Animal = {
    specie = "caracal";
    energy = 10;
  };

  let cessna_citation : PrivateJet = {
    fuel = 127323;
    hours_flown = 1200;
    market_price = 83293193;
    isOperational = #worse_than_dog_water;
  };

  public func fun() : async condition {
    return cessna_citation.isOperational;
  };

  public func create_animal_then_takes_a_break(s : Text, e : Nat) : async Animal {
    var created_animal : Animal = {
      specie = s;
      energy = e + 10;
    };
    push_animal(created_animal);
    return created_animal;
  };

  public func push_animal(a : Animal) : () {
    animals := List.push<Animal>(a, animals);
  };

  public func get_animals() : async [Animal] {
    return (List.toArray<Animal>(animals));
  };

}; 
