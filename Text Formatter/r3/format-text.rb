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
    t = ""
    p = string.split("\n")
    p.each do |line|
      if newline_counter > 1 && line != ""
        output_array.push(t)
        t = ""
        t << line
        newline_counter = 0
      else
        if line == ""
          newline_counter = newline_counter + 1 
        else
          t = t.strip()
          line = line.strip()
          t << " "
          t << line
        end
      end

      output_array.push(t) if line == p[p.length-1]
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

  def capitalize 
    # takes a string and returns the string with the first letter
    # upcased
  end

  def short_lines
    # takes a string and returns the string with all lines shorter
    # than 80 characters, except for 80 character long words
    # lines are broken before or after a word
  end

  def output
    # takes a string, sends string to an output, currently standard out
  end

end

# prevents these methods from being called automatically when requiring in the
# file for a test
if __FILE__ == $0
  formatter = TextFormatter.new()
end