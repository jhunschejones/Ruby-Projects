# This is the application code as it was turned in with the coding challenge
class TextFormatter

  def initialize
  end

  # handles outputing the final string, currently sending to standard out
  def output_formatted_text(output_string)
    puts output_string
  end

  # this is the main function that calls the other functions in the proper 
  # order to generate a formated string
  def format_file(input_file)
    if input_file && 
      File.file?(input_file) && 
      input_file != "-h" && 
      input_file != "-help" 
    then
      long_paragraphs = read_file_to_string(input_file)
      formatted_paragraphs = long_paragraphs.split("\n\n").map do |paragraph| 
        shorten_lines(paragraph).chomp(" ") 
      end
      return formatted_paragraphs.join("\n\n")
    else
      if input_file == "-h" || input_file == "-help"
        message = "HELP"
      else
        message = "INVALID INPUT"
      end
      output_string = "*#{message}* To use this text formatter, run "\
                      "`ruby format-text.rb {file_name}.txt`"
      return "=" * output_string.length + 
             "\n" + output_string + "\n" + "=" * output_string.length
    end
  end

  def read_file_to_string(input_file)
    output_string = ""
    newline_counter = 0

    f = File.open("#{input_file}", "r")
    f.each_line do |line| 
      # if the line is only a newline, increment the counter
      if line == "\n"
        newline_counter += 1
      else
        # if the line is not a newline and the counter is more than zero
        if newline_counter > 0
          newline_counter = 0
          output_string << "\n\n" << clean_up_line(line)

        # if the line is not a newline and the counter is not more than zero
        else
          output_string << clean_up_line(line)
        end
      end
    end
    f.close

    return output_string
  end

  # removes extra spaces and line breaks, adds a final space if there is none
  def clean_up_line(input_string)
    input_string = input_string.split.join(" ")
    input_string += " " if input_string[-1] != " "
    return input_string
  end

  # takes in a string and returns the same string but split over multiple 
  # lines on the last full word if it is longer than 80 characters
  # NOTE: single words over 80 characters will not be split up
  def shorten_lines(long_line)
    if long_line.length > 80
      index = 0
      short_lines = ""
      long_line.split(" ").each do |word|
        # line length so far + the current word length
        index = index + word.length
        if index < 80
          short_lines = short_lines + word + " "
          # add 1 to word length to account for trailing space
          index = index + 1
        else
          # if the line is longer than 80 characters, cut off the trailing space
          # and add a newline
          short_lines = short_lines.chomp(" ") + "\n" + word + " "
          # the word is now placed on the next line and the line length resets
          index = word.length + 1
        end
      end
      return short_lines
    else
      return long_line
    end
  end

end

# prevents these methods from being called automatically when requiring in the
# file for a test
if __FILE__ == $0
  formatter = TextFormatter.new()
  # ARGV.first gets the file name passed in as the first parameter, i.e. `ruby 
  # format-text.rb input.txt`
  formatted_text = formatter.format_file(ARGV.first)
  formatter.output_formatted_text(formatted_text)
end