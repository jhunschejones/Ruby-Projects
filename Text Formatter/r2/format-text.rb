# This is a refactor of the application code after it was turned in with the coding challenge
class TextFormatter

  def initialize
  end

  def format_text_from_file(input_file)
    verified_file = valid_input(input_file)
    if verified_file[:valid]
      file_text = read_file(input_file)
      formatted_text = format_text(file_text)
      return formatted_text
    else
      output_string = "*#{verified_file[:message]}* To use this text formatter, run "\
        "`ruby format-text.rb {file_name}.txt`"
      puts "=" * output_string.length + 
        "\n" + output_string + 
        "\n" + "=" * output_string.length
    end
  end

  def valid_input(input_file)
    if input_file == "-h" || input_file == "-help"
      return { valid: false, message: "HELP" }
    elsif !input_file || !File.file?(input_file)
      return { valid: false, message: "INVALID INPUT" }
    else
      return { valid: true }
    end
  end

  def read_file(input_file)
    output_string = ""
    f = File.open("#{input_file}", "r")
    f.each_line do |line| 
      output_string << line
    end
    f.close
    return output_string
  end

  def format_text(file_text)
    collapsed_newlines = collapse_newlines(file_text)
    removed_spaces = remove_extra_spaces(collapsed_newlines)
    shortened_lines = shorten_lines(removed_spaces)
    return shortened_lines
  end

  def collapse_newlines(input_string)
    newline_counter = 0
    output_string = ""
    input_string.split("\n").each do |line|
      if line.length > 0
        output_string << "\n\n" if newline_counter > 1
        output_string << line
        output_string << " " if output_string[-1] != " "
      else
        newline_counter = newline_counter + 1
      end
    end
    return output_string
  end

  def remove_extra_spaces(input_string)
    output = input_string.split("\n\n").map do |line|
      line = line.split.join(" ")
    end 
    return output.join("\n\n")
  end

  def shorten_lines(input_text)
    output = input_text.split("\n\n").map do |line|
      if line.length > 80
        index = 0
        line = line.split.map do |word|
          # calculating index before deciding whether to add a new line
          # moves words longer than 80 characters to their own line
          # Note: adding 1 to account for the space after a word
          index = index + word.length + 1
          if index < 81
            word
          else
            index = word.length + 1
            word = "\n" + word
          end
        end
        line.join(" ")
      else
        line
      end
    end
    return output.join("\n\n")
  end

  # Separating this method out for ease of refactoring if app output 
  # requirements change. This also enables a fairly complete integration test
  # of the remaining functionality of the app.
  def output_formatted_text(output_string)
    puts output_string
  end
end

# prevents these methods from being called automatically when requiring in the
# file for a test
if __FILE__ == $0
  formatter = TextFormatter.new()
  formatted_text = formatter.format_text_from_file(ARGV.first)
  formatter.output_formatted_text(formatted_text)
end