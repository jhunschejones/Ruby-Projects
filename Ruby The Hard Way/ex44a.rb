# Inheritence 

class Parent
  
  def override()
    puts "PARENT override()"
  end

  def implicit()
    puts "PARENT implicit()"
  end

  def altered()
    puts "PARENT altered()"
  end
end

# the child class is inheriting from the parent class
class Child < Parent

  # because this method is named the same, it overrides the inherited class
  def override()
    puts "CHILD override()"
  end

  def altered()
    # here we have overriden the altered() method from the parent
    puts "CHILD, BEFORE PARENT altered()"
    # this goes back and gets the version of this method from the parent
    super()
    # this is again overriding what is in the parent and doing something different
    puts "CHILD, AFTER PARENT altered()"
  end
end

dad = Parent.new()
son = Child.new()

dad.implicit()
son.implicit()

dad.override()
son.override()

dad.altered()
son.altered()