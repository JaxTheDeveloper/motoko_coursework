module {
  public type Animal = {
    specie : Text;
    energy : Nat;
  };

  public func animal_sleep(animal : Animal) : Animal {
    let slept_animal = {
      specie = animal.specie;
      energy = animal.energy + 10;
    };
    return slept_animal;
  }

}