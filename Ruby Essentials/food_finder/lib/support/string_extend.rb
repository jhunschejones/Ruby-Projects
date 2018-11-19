# This helper adds a method to Ruby's String class to 
# capitolize the first letter of every word in a string
class String
  def title_case
    self.split(' ').map {|word| word.capitalize() }.join(" ")
  end

end