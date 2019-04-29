class TextFormatter
  def initialize
  end

  def format(arguments_array)

    if arguments_array.length > 1
      margin = arguments_array[0][9-10].to_i
      text_file = arguments_array[1]
    else
      margin = 0
      text_file = arguments_array[0]
    end

    string = read_file(text_file)
    string = whitespace(string)
    paragraphs = paragraphs(string)
  
    paragraphs = paragraphs.map do |paragraph|
      sentences = sentences(paragraph)
  
      sentences = sentences.map do |sentence|
        sentence = capitalize(sentence)
      end
  
      paragraph = sentences.join("")
      paragraph = formatted_lines(paragraph, margin: margin)
    end
  
    output_string = "\n" * margin + paragraphs.join("\n\n") + "\n" * margin
  end

  def read_file(file)
    output_string = ""

    f = File.open("#{file}", "r")
    f.each_line { |line| output_string << line }
    f.close

    output_string
  end

  def whitespace(string)
    lines = string.split("\n")
    output = lines.map { |line| line.split.join(" ") unless line.empty? }
    output.join("\n")
  end

  def paragraphs(string)
    newline_counter = 0
    output_array = []
    temp_string = ""
    lines = string.split("\n")
    lines.each do |line|
      if newline_counter > 1 && !line.empty?
        temp_string = temp_string.rstrip << " "
        output_array.push(temp_string)
        temp_string = "" << line
        newline_counter = 0
      else
        if line.empty?
          newline_counter = newline_counter + 1 
        else
          temp_string = temp_string.strip << " " << line.strip
        end
      end

      if line == lines[lines.length-1]
        temp_string = temp_string.rstrip << " "
        output_array.push(temp_string) 
      end
    end

    output_array
  end

  def sentences(string)
    punctuation_marks = [". ", "! ", "? ", ".... "]
    exceptions = ["Mr. ", "Mrs. ", "Ms. ", "Miss. ", "Sr. ", "Fr. "]

    output_array = split_on_punctuation(string, punctuation_marks)
    output_array = join_exceptions(output_array, exceptions)
  end

  def split_on_punctuation(input_string, punctuation_marks)
    output_array = [input_string]

    punctuation_marks.each do |punctuation|
      output_array = output_array.map do |string|
        sentences = string.split(punctuation)
        
        sentences = sentences.map do |sentence|
          if sentence[-1] != " "
            sentence << punctuation
          else
            sentence
          end
        end
      end
      output_array = output_array.flatten
    end

    output_array
  end

  def join_exceptions(input_array, exceptions)
    temp_string = ""
    output_array = []

    input_array.each do |element|
      exception_hit = false
      exceptions.each do |exception|
        if element.chars.last(4).join == exception ||
          element.chars.last(5).join == exception || 
          element.chars.last(6).join == exception
        then
          temp_string << element
          exception_hit = true
        end
      end

      if !exception_hit && !temp_string.empty?
        temp_string = temp_string << element
        output_array.push(temp_string)
        temp_string = ""
      elsif !exception_hit
        output_array.push(element)
      end
    end

    output_array
  end

  def capitalize(string)
    string[0] = string[0].upcase
    string
  end

  def formatted_lines(string, opts = {})
    margin = opts[:margin] || 0
    line_length = 80 - margin * 2
    words = string.split(" ")
    output_string = ""

    while !words.empty? do
      next_line, words = *next_line_from(words, line_length)
      output_string << " " * margin + next_line + "\n"
    end

    # last pass through adds an extra `\n`
    output_string.rstrip!
  end

  def next_line_from(words, line_length)
    this_line = ""
    remaining_words = words.dup

    while !remaining_words.empty? do
      word = remaining_words.shift

      if this_line.length + word.length < line_length
        this_line << word + " "
      elsif word.length > line_length && this_line.empty?
        this_line << word
      else
        remaining_words.unshift(word)
        break
      end
    end

    return this_line.rstrip, remaining_words
  end
  
end

if __FILE__ == $0
  formatter = TextFormatter.new()
  output_string = formatter.format(ARGV)
  puts output_string
end