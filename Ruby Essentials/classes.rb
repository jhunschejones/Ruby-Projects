class Animal
  # bulding instance getter / setter methods
  attr_accessor :name
  attr_writer :color
  attr_reader :legs, :arms

  # these are class variables
  @@species = ['cat', 'cow', 'dog', 'duck', 'horse', 'pig']
  @@current_animals = []
  
  # bulding class getter method, there is no shorthand for this
  def self.species
    @@species
  end
  
  # building class setter method, there is no shorthand for this
  def self.species=(array=[])
    @@species = array
  end
  
  # this is a class method
  def self.current_animals
    @@current_animals
  end
  
  # this is a class method
  def self.create_with_attributes(noise, color)
    animal = self.new(noise)
    animal.color = color
    return animal
  end
  
  # this class method is executed when we call `Animal.new`
  def initialize(noise, legs=4, arms=0)
    @noise = noise
    @legs = legs
    @arms = arms
    @@current_animals << self
    puts "A new animal has been instantiated."
  end
  
  # long-form way to build a setter method for an instance variable
  def noise=(noise)
    @noise = noise
  end
  
  # long-form way to build a getter method for an instance variable
  def noise
    @noise
  end
  
  def color
    "The color is #{@color}."
  end
end

# class Cow is-a Animal
class Cow < Animal
  # overriding method inherited from superclass (parent class)
  def color
    "The cow's color is #{@color}."
  end

  # second definition replaces the first since they are read in sequentially
  def color 
    "My color is #{@color}."
  end
end

# class Pig is-a Animal
class Pig < Animal
  def noise
    # using `super` to access the method from the super/parent class  
    # which is written to return the @noise attribute to the function
    parent_noise = super
    return "Hello and also #{parent_noise}"
  end
end


Animal.species = ['frog', 'fish']
# use inspect to display an instance as a flattened array
puts Animal.species.inspect

animal1 = Animal.new("Moo!", 4, 0)
animal1.name = "Steve"
puts animal1.name
animal1.color = "black"
puts animal1.color
puts animal1.legs
puts animal1.noise

animal2 = Animal.create_with_attributes("Quack!", "white")
puts animal2.noise
puts animal2.color

puts Animal.current_animals.inspect

maisie = Cow.create_with_attributes("Moo!", "yellow")
puts maisie.noise
# shows this is an Animal
puts animal1.class
# shows this is a Class
puts maisie.class
# set when using .create_with_attributes instead of just .new 
puts maisie.color

wilbur = Pig.new("Oink!")
puts wilbur.noise