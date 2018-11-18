# seperating this module out into it's own file
# using `require` because this only loads once instead of every time it's called like `load`
require 'contact_info.rb'
class Person
  include ContactInfo
end

require 'contact_info.rb'
class Teacher
  include ContactInfo
  attr_accessor :lesson_plans
end

# attributes from mixins can be inherited
class Student < Person
  attr_accessor :books, :grades
end