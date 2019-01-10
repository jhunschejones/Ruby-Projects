class TextFormatter
  def initialize
  end

  def read_file(file)
    output_string = ""

    f = File.open("#{file}", "r")
    f.each_line.each { |line| output_string << line }
    f.close

    output_string
  end

  def whitespace(string)
    n = string.split("\n")
    o = n.map { |line| line.split.join(" ") unless line == "" }
    output_string = o.join("\n")

    output_string
  end

  def paragraphs(string)
    newline_counter = 0
    output_array = []
    temp_string = ""
    p = string.split("\n")
    p.each do |line|
      if newline_counter > 1 && line != ""
        temp_string << " " if temp_string[-1] != " "
        output_array.push(temp_string)
        temp_string = ""
        temp_string << line
        newline_counter = 0
      else
        if line == ""
          newline_counter = newline_counter + 1 
        else
          temp_string = temp_string.strip()
          line = line.strip()
          temp_string << " "
          temp_string << line
        end
      end

      if line == p[p.length-1]
        temp_string << " " if temp_string[-1] != " "
        output_array.push(temp_string) 
      end
    end

    output_array
  end

  def sentences(string)
    punctuation = [". ", "! ", "? ", ".... "]
    exceptions = ["Mr. ", "Mrs. ", "Ms. ", "Miss. ", "Sr. ", "Fr. "]

    output_array = split_on_punctuation(string, punctuation)
    output_array = join_exceptions(output_array, exceptions)

    output_array
  end

  def split_on_punctuation(string, punctuation)
    output_array = [string]

    punctuation.each do |p|
      output_array = output_array.map do |s|
        s = s.split(p)
        
        s = s.map do |sentence|
          if sentence[-1] != " "
            sentence = sentence << p 
          else
            sentence
          end
        end
      end
      output_array = output_array.flatten()
    end

    output_array
  end

  def join_exceptions(input_array, exceptions)
    s = ""
    output_array = []

    input_array.each do |element|
      t = false
      exceptions.each do |exception|
        if element.chars.last(4).join == exception ||
          element.chars.last(5).join == exception || 
          element.chars.last(6).join == exception
        then
          s << element
          t = true
        end
      end
      if !t && s.length > 0
        s = s << element
        output_array.push(s)
        s = ""
      elsif !t
        output_array.push(element)
      end
    end

    output_array
  end

  def capitalize(string)
    first_character = string[0]
    string[0] = first_character.upcase

    string
  end

  def short_lines(string)
    words = string.split(" ")
    output_string = ""
    counter = 0

    words.each do |word|
      if counter + word.length < 80
        output_string << word
        output_string << " "
        counter = counter + word.length + 1
      else
        output_string = output_string.strip()
        output_string << "\n"
        output_string << word
        output_string << " "
        counter = word.length + 1
      end
    end

    output_string
  end

end

if __FILE__ == $0
  formatter = TextFormatter.new()
  string = formatter.read_file(ARGV.first)
  string = formatter.whitespace(string)
  paragraphs = formatter.paragraphs(string)

  paragraphs = paragraphs.map do |paragraph|
    sentences = formatter.sentences(paragraph)

    sentences = sentences.map do |sentence|
      sentence = formatter.capitalize(sentence)
    end

    paragraph = sentences.join("")
    paragraph = formatter.short_lines(paragraph)
  end

  output_string = paragraphs.join("\n\n")
  puts output_string
end