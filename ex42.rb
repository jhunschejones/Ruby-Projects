# Animal is-a object
class Animal
end

# Dog is-a animal
class Dog < Animal
  def initialize(name)
    # Dog has-a name
    @name = name
  end
end

# Cat is-a animal
class Cat < Animal
  def initialize(name)
    # Cat has-a name
    @name = name
  end
end

# Person is-a object
class Person
  def initialize(name)
    # Person has a name
    @name = name

    # Person has-a pet
    @pet = nil
  end

  # you can access pet outside of the object
  attr_accessor :pet
end

# Employee is-a person
class Employee < Person
  def initialize(name, salary)
    # Take the name from Person?
    super(name)

    # Person has-a salary
    @salary = salary
  end
end

# Fish is-a object
class Fish
end

# Salmon is-a Fish
class Salmon < Fish
end

# Halibut is-a Fish
class Halibut < Fish
end

# Rover is-a dog
rover = Dog.new("Rover")

# Satan is-a cat
satan = Cat.new("Satan")

# Mary is a person
mary = Person.new("Mary")

# Mary has-a pet who is-a cat who has-a name satan
mary.pet = satan

# Frank is-a employee, Frank has-a salary
frank = Employee.new("Frank", 120000)

# Frank has-a pet, who is-a dog, who has-a name rover
frank.pet = rover

## Flipper is-a fish
flipper = Fish.new()

# Crouse is-a salmon / is-a fish
crouse = Salmon.new()

# Harry is-a Halibut / is-a fish
harry = Halibut.new()