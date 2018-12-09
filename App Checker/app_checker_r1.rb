# require 'net/http'

class Checker

  def initialize
    @required_apps = ["Google Chrome", "Vlc", "Bear", "Visual Studio Code", "Postman"]
    @missing_apps = []

    puts "***********"
    puts "App Checker"
    puts "***********"
    puts "1. Show required apps"
    puts "2. Run App Checker"
    until @user_selection == "1" || @user_selection == "2" || @user_selection == "quit"
      print "> "
      @user_selection = $stdin.gets.chomp.downcase
      puts "Please choose an option by entering the corresponding number." if @user_selection != "1" && @user_selection != "2" && @user_selection != "quit"
    end

    if @user_selection == "1"
      puts "\nRequired apps:"
      puts "**************"
      puts @required_apps
      puts "\n"
    elsif @user_selection == "2"
      # back up a directory to the root directory
      Dir.chdir("..") until Dir.pwd == "/"
      # go into the `Applications` directory
      Dir.chdir("/Applications")
      # pull a list of all apps that aren't system files
      @other_apps = Dir.entries(".").sort.delete_if {|name| name[0] == "." }

      @app_string = ""
      @required_apps.each do |app|
        if !File.exist?("#{app}.app")
          # missing apps are collected
          @missing_apps.push("- #{app}")
          # add un-checked-app to note string
          @app_string += "- [ ] #{app}\n"
        else
          # existing required apps removed from `other_apps`
          @other_apps.delete("#{app}.app")
          # add checked-app to note string
          @app_string += "- [x] #{app}%0A"
        end
      end
      # use url-safe spaces for note string
      @app_string = @app_string.gsub(" ", "%20")

      if @missing_apps.length > 0
        puts "\nMissing Apps:"
        puts "*************"
        puts @missing_apps 
        puts "\n"
      else
        puts "\nCongratulations! All the required apps are already installed."
        puts "\n"
      end

      # set up time string
      @date = Time.now
      @date = @date.strftime("%d-%m-%Y").gsub("-", "%2F")
      @date = @date.slice!(1..-1) if @date[0] == "0"

      # set up x-callback-url for bear note using note string
      @bear_url = "bear://x-callback-url/create?title=Apps%20To%20Install%2C%20#{@date.to_s}&text=%2D%2D%2D%0A#{@app_string}"
      puts "Create a note:"
      puts @bear_url.chomp + "\n\n"

      # this opens only part of the URL in the default browser
      # if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
      #   system "start #{link}"
      # elsif RbConfig::CONFIG['host_os'] =~ /darwin/
      #   system "open #{link}"
      # elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
      #   system "xdg-open #{link}"
      # end      

      # show number of additional apps
      puts "-- There are #{@other_apps.length} additional apps installed. --\n\n"
    else
      puts "\nQuitting App Checker."
    end
  end
end

app_checker = Checker.new()