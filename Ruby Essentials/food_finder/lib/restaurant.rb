require 'support/number_helper'
require 'support/object_extend'

class Restaurant
  include NumberHelper

  # this is a class variable
  @@filepath = nil
  # here is the setter method for the class variable
  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path) 
  end

  attr_accessor :name, :cuisine, :price

  # this is a class method
  def self.file_exists?
    if @@filepath && File.exists?(@@filepath)
      return true
    else
      return false
    end
  end

  def self.file_usable?
    return false unless @@filepath
    return false unless File.exists?(@@filepath)
    return false unless File.readable?(@@filepath)
    return false unless File.writable?(@@filepath)
    return true
  end

  def self.create_file
    File.open(@@filepath, 'w') unless file_exists?
    return file_usable?
  end

  def self.saved_restaurants
    restaurants = []
    if file_usable?
      file = File.new(@@filepath, 'r')
      file.each_line do |line|
        restaurants << Restaurant.new.import_line(line.chomp())
      end
      file.close()
    end
    return restaurants
  end

  def self.build_using_input
    restaurant_details = {}
    print "Restaurant name: "
    restaurant_details[:name] = gets.chomp.strip()
    print "Cuisine type: "
    restaurant_details[:cuisine] = gets.chomp.strip()
    print "Average meal price: "
    restaurant_details[:price] = gets.chomp.strip()

    return self.new(restaurant_details)
  end

  def initialize(args={})
    @name    = args[:name]    || ""
    @cuisine = args[:cuisine] || ""
    @price   = args[:price]   || ""
  end

  def import_line(line)
    line_array = line.split("\t")
    # assigns three values to three items in array
    @name, @cuisine, @price = line_array
    return self
  end

  def save
    return false unless Restaurant.file_usable?
    File.open(@@filepath, 'a') do |file|
      file.puts "#{[@name, @cuisine, @price].join("\t")}\n"
    end
    return true
  end

  def formatted_price
    # loop through price and remove starting  
    # characters until you get to a number
    until @price[0].is_number? 
      @price.tr!(@price[0], '')
    end

    number_to_currency(@price)
  end

end