require 'restaurant'
require 'support/string_extend'
class Guide
  class Config
    @@actions = ['list', 'find', 'add', 'quit']
    def self.actions
      @@actions
    end
  end
  
  def initialize(path=nil)
    Restaurant.filepath = path
    if Restaurant.file_usable?
      puts "Found restaurant file."
    elsif Restaurant.create_file
      puts "Created restaurant file."
    else
      puts "Exiting.\n\n"
      # Ruby command to exit immediately
      exit!
    end
  end

  def launch
    introduction()
    action_result = nil
    # using `until` instead of `loop do` and `break if`
    until action_result == :quit
      action, input_array = get_action()
      action_result = do_action(action, input_array)
    end
    conclusion()
  end

  def get_action
    action = nil
    # keeps asking for user input until action is valid
    until Guide::Config.actions.include?(action)
      # only shows these instructions if action is invalid
      puts "Available actions: " + Guide::Config.actions.join(", ") if action
      print "> "
      user_response = gets.chomp()
      input_array = user_response.downcase.strip.split(' ')
      action = input_array.shift()
    end
    return action, input_array
  end

  def do_action(action, input_array=[])
    case action
    when 'list'
      list(input_array)
    when 'find'
      keyword = input_array.shift()
      find(keyword)
    when 'add'
      add()
    when 'quit'
      return :quit
    else
      puts "\nI don't understand that command.\n"
    end
  end

  def find(keyword="")
    output_action_header("Find a restaurant")
    if keyword
      restaurants = Restaurant.saved_restaurants()
      found = restaurants.select do |restaurant|
        restaurant.name.downcase.include?(keyword.downcase) || 
        restaurant.cuisine.downcase.include?(keyword.downcase) ||
        # find restaurants with a price less than or eqal to searched price
        # use the formatted price from the second character to the end
        # otherwise special characters return `0` for .to_i, same as a string
        # also handles if user puts `$` or not in their find-by-price command
        restaurant.formatted_price[1..-1].to_i <= keyword.gsub("$", "").to_i
      end
      output_restaurant_table(found)
    else
      puts "Use Find with a key phrase to search the restaurant list."
      puts "Examples: 'find tamale', 'find Mexican', 'find mex'\n\n"
    end
  end

  def list(input_array=[])
    sort_order = input_array.shift
    # go to next word in input array if second word is "by"
    sort_order = input_array.shift if sort_order == "by"
    sort_order = "name" unless sort_order && ['name', 'cuisine', 'price'].include?(sort_order.downcase())
    output_action_header("Listing restaurants")
    restaurants = Restaurant.saved_restaurants()
    # sort in place, pass in code block
    restaurants.sort! do |r1, r2|
      case sort_order
      when 'name'
        r1.name.downcase() <=> r2.name.downcase()
      when 'cuisine'
        r1.cuisine.downcase() <=> r2.cuisine.downcase()
      when 'price'
        # using formatted price and removing first character to handle extra `$`
        r1.formatted_price[1..-1].to_i <=> r2.formatted_price[1..-1].to_i
      end
    end
    output_restaurant_table(restaurants)
    puts "Sort using a phrase, i.e. 'list cuisine' or 'list by cuisine'\n\n" 
  end

  def add
    output_action_header("Add a restaurant")
    restaurant = Restaurant.build_using_input
    if restaurant.save()
      puts "\nRestaurant Added\n\n"
    else
      puts "\nSave Error: Restaurant not added\n\n"
    end
  end

  def introduction
    puts "\n\n<<< Welcome to the Food Finder >>>\n\n"
    puts "This is an interactive guide to help you find the food you're craving!\n\n"
  end

  def conclusion
    puts "\n <<< Goodbye and Bon Appetit! >>>\n\n\n"
  end

  def output_action_header(text)
    puts "\n#{text.upcase().center(60)}\n\n"
  end

  def output_restaurant_table(restaurants=[])
    # output table header, 60 characters wide
    print " " + "Name".ljust(26)
    print " " + "Cuisine".ljust(24)
    print " " + "Price".rjust(6) + "\n"
    puts "-" * 60
    # output table rows, 60 characters wide total
    restaurants.each do |restaurant|
      line = " " << restaurant.name.title_case.ljust(26)
      line << " " + restaurant.cuisine.title_case.ljust(24)
      line << " " + restaurant.formatted_price.rjust(6)
      puts line
    end
    puts "No listings found" if restaurants.empty?
    puts "-" * 60
  end

end
