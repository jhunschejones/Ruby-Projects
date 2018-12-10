class AppChecker
  # allow users to set required apps per-instance
  attr_accessor :required_apps

  def initialize()
  end

  def run
    puts "*******************************"
    puts "Welcome to the App Checker Menu"
    puts "*******************************"
    puts "1. Show required apps"
    puts "2. Run App Checker"
    puts "3. Quit"
    user_selection = "none"
    while true
      print "> "
      user_selection = $stdin.gets.chomp.downcase
      if user_selection == "1"
        display_required_apps(@required_apps)
        return_to_menu_instruction
        run
      elsif user_selection == "2"
        navigate_to_applications_dir
        other_apps = get_app_list
        app_string, missing_apps, other_apps = check_for_required_apps(other_apps)
        display_check_results(app_string, missing_apps, other_apps)
        return_to_menu_instruction
        run
      elsif user_selection == "quit" || user_selection == "3"
        puts "\nQuitting App Checker. Come back soon!\n\n"
        exit!
      else
        puts "Please choose an option by entering the corresponding number."
      end
    end
  end

  def display_required_apps(required_apps)
    puts "\nRequired apps:\n**************\n"
    puts required_apps
  end

  def navigate_to_applications_dir 
    # back up a directory to the root directory
    Dir.chdir("..") until Dir.pwd == "/"
    # go into the `Applications` directory
    Dir.chdir("/Applications")
  end

  def get_app_list
    # pull a list of all apps that aren't system files
    other_apps = Dir.entries(".").sort.delete_if {|name| name[0] == "." }
    return other_apps
  end

  def check_for_required_apps(other_apps)
    app_string = ""
    missing_apps = []
    @required_apps.each do |app|
      if !File.exist?("#{app}.app")
        # missing apps are collected
        missing_apps.push("- #{app}")
        # add un-checked-app to note string
        app_string += "- [ ] #{app}\n"
      else
        # existing required apps removed from `other_apps`
        other_apps.delete("#{app}.app")
        # add checked-app to note string
        app_string += "- [x] #{app}%0A"
      end
    end
    # use url-safe spaces for note string
    app_string = app_string.gsub(" ", "%20")
    return app_string, missing_apps, other_apps
  end

  def display_check_results(app_string, missing_apps, other_apps)
    if missing_apps.length > 0
      puts "\nMissing Apps:"
      puts "*************"
      puts missing_apps 
      puts "\n"
    else
      puts "\nCongratulations! All the required apps are already installed."
      puts "\n"
    end

    # set up x-callback-url for bear note using app string
    if File.exist?("Bear.app")
      bear_url = "bear://x-callback-url/create?title=Apps%20To%20Install%2C%20#{get_nice_date}&text=%2D%2D%2D%0A#{app_string}"
      puts "Create a note:"
      puts bear_url.chomp + "\n\n"
    end

    # show number of additional apps
    puts "-- There are #{other_apps.length} additional apps installed. --"
  end

  def get_nice_date
    date = Time.now
    date = date.strftime("%d-%m-%Y").gsub("-", "%2F")
    date = date.slice!(1..-1) if date[0] == "0"
    return date.to_s
  end

  def return_to_menu_instruction
    puts "\n"
    puts "[Enter to return to menu]"
    $stdin.gets.chomp
  end
end

# prevents these methods from being called automatically when requiring in the
# file for a test
if __FILE__ == $0
  app_checker = AppChecker.new
  app_checker.required_apps = ["Google Chrome", "Vlc", "Bear", "Visual Studio Code", "Postman"]
  app_checker.run
end