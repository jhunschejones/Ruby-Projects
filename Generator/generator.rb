class Generator
  def initialize
  end

  def start
    puts "\nLet's gather some information to make your phrase/name generator!"
    puts "To start, please provide an image URL for your generator's icon."
    print "> "
    @image_source = $stdin.gets.chomp

    puts "\nWhat is going to be the name of the generator? For example if a generator creates "
    puts "pizza flavor names, you might enter `Pizza Flavor` as the name of the generator."
    print "> "
    @generator_name = $stdin.gets.chomp

    puts "\nNow the next steps require close attention. The we are now going to gather a list"
    puts "of words used to generate your custom names or phrases. To do this, please enter"
    puts "a comma-separated list of words or phrases. For example: `Cheesy, Gluten Free, "
    puts "Vegan Free` for our example pizza-flavor-name generator."
    print "> "
    @words = $stdin.gets.chomp.split(",")

    puts "\nYou're getting the hang of this! Now we'll collect the start-words for the names"
    puts "or phrases being generated in a comma-separated list. For example: "
    puts "`Fresh, Uncooked, Burned` for our pizza flavor name generator. These words will"
    puts "only ever appear first in a name or phrase."
    print "> "
    @start_words = $stdin.gets.chomp.split(",")

    puts "\nNext, we'll do the same thing for end-words. Enter a comma-separated list of"
    puts "words that will only ever appear at the end of a name or phrase. For example:"
    puts "`Pan Pizza, Deep Dish`."
    print "> "
    @end_words = $stdin.gets.chomp.split(",")

    puts "\nNow let's give your application some style! What color would you like to use?"
    puts "1. Blue"
    puts "2. Medium Grey"
    puts "3. Green"
    puts "4. Red"
    puts "5. Yellow"
    puts "6. Teal"
    puts "7. Dark Grey"
    print "> "
    @color_selection = $stdin.gets.chomp.downcase

    if @color_selection == "1" || @color_selection == "blue"
      @color = "primary"
    elsif @color_selection == "2" || @color_selection == "medium grey" || @color_selection == "grey"
      @color = "secondary"
    elsif @color_selection == "3" || @color_selection == "green"
      @color = "success"
    elsif @color_selection == "4" || @color_selection == "red"
      @color = "danger"
    elsif @color_selection == "5" || @color_selection == "yellow"
      @color = "warning"
    elsif @color_selection == "6" || @color_selection == "teal"
      @color = "info"
    elsif @color_selection == "7" || @color_selection == "dark grey"
      @color = "dark"
    else
      # no selection detected
    end

    puts "\nFinally, lets put some limits on the length of the names/phrases that can be"
    puts "generated:"
    print "Minimum length (as an integer) > "
    @min = $stdin.gets.chomp.to_i

    print "Maximum length (as an integer) > "
    @max = $stdin.gets.chomp.to_i

    puts "\nBonus: Would you like to show an acronym after the name or phrase that your"
    puts "user generates?"
    print "> "
    @acronym_choice = $stdin.gets.chomp.downcase

    if @acronym_choice == "yes" || @acronym_choice == "y"
      @hide_acronym = " + `<span class=\"font-weight-light\">&nbsp;(${acronym})</span>`;"
    elsif @acronym_choice == "no" || @acronym_choice == "n"
      @hide_acronym = ";"
    else
      # a different selection was detected, show acronym by default
      @hide_acronym = " + `<span class=\"font-weight-light\">&nbsp;(${acronym})</span>`;"
    end

    @html_template = "<!doctype html>\n<html lang=\"en\">\n  <head>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">     \n    <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\" integrity=\"sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO\" crossorigin=\"anonymous\">\n    <title>#{@generator_name}</title>\n    <style>\n      #page-content {\n        margin-top: 50px;\n        text-align: center;\n      }\n      #logo {\n        display: inline-flex;\n        height: 80px;\n        margin-top: -20px;\n      }\n      #title {\n        display: inline-flex;\n        margin-left: 8px;\n      }\n      #generate-phrase {\n        margin-top: 5px;\n      }\n      #phrase-result {\n        margin-top: 55px;\n      }\n      #previous-button {\n        display: none;\n        opacity: 0.3;\n        cursor: pointer;\n      }\n    </style>\n  </head>\n  <body>\n    <div id=\"page-content\" class=\"container-fluid\">\n      <div>\n        <img id=\"logo\" src=\"#{@image_source}\">\n        <h1 id=\"title\">#{@generator_name} Generator</h1>\n      </div>\n\n      <button id=\"generate-phrase\" type=\"button\" class=\"btn btn-sm btn-#{@color}\">Generate #{@generator_name}</button>\n\n      <h4 id=\"phrase-result\" class=\"text-#{@color}\"></h4>\n\n      <span id=\"previous-button\" class=\"text-secondary\">&#8249;&nbsp;&nbsp;Previous</span>\n    </div>\n\n    <script>\n      const words = #{@words};\n      const endWord = #{@end_words};\n      const startWord = #{@start_words.push("", "")};\n      let history = [];\n\n      function generateRandomNumberBetween(max, min) {\n        const random_number = Math.random() * (max - min) + min;\n        return Math.floor(random_number);\n      }\n\n      function generatePhrase() {\n        let result = \"\";\n        let acronym = \"\";\n        let theseWords = words.slice(0);\n        for (let index = 0; index < generateRandomNumberBetween(#{@min}, #{@max}); index++) {\n          const wordIndex = generateRandomNumberBetween(theseWords.length, 0);\n          const word = theseWords[wordIndex];\n          theseWords.splice(wordIndex, 1);\n          result += word.trim() + \" \" ;\n        }\n        result += endWord[generateRandomNumberBetween(0, endWord.length)].trim();\n        result = startWord[generateRandomNumberBetween(0, startWord.length)].trim() + \" \" + result;\n        result.trim().split(\" \").forEach(word => { acronym += word.charAt(0).toUpperCase(); });\n        result = result.trim()#{@hide_acronym}\n        document.getElementById(\"phrase-result\").innerHTML = result;\n        \n        history.push(result);\n        if (history.length > 1) { document.getElementById(\"previous-button\").style.display = \"block\" };\n      }\n      function goBack() {\n        const position = history.indexOf(document.getElementById(\"phrase-result\").innerHTML) - 1;\n        document.getElementById(\"phrase-result\").innerHTML = history[position];\n        if (position == 0) { document.getElementById(\"previous-button\").style.display = \"none\" };\n      }\n      document.getElementById(\"generate-phrase\").addEventListener(\"click\", generatePhrase);\n      document.getElementById(\"previous-button\").addEventListener(\"click\", goBack);\n    </script>\n  </body>\n</html>"

    print_template

    puts "\nYour application is ready! Check the directory where you ran this generator app."
    puts "The file will be titled `#{@generator_name}.html`. Enjoy!"
  end

  def print_template
    # write html template to file
    test_file_1 = File.new("#{@generator_name}.html", 'w')
    test_file_1.write(@html_template)
    test_file_1.close 
  end
end

my_generator = Generator.new
my_generator.start