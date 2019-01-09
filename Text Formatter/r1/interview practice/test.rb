require 'test/unit'
require_relative './format-text.rb'

class TextFormatterTests < Test::Unit::TestCase

  def setup
    @formatter = TextFormatter.new()

    test_file_1 = File.new('test.txt', 'w')
    test_file_1.write("This is a\ntest file to use with the test suite.\n\n\n\n\nBunch 'o bad formatting here, sorry!")
    test_file_1.close 

    test_file_2 = File.new('test2.txt', 'w')
    test_file_2.write("This is\na seccond test. It has some  characteristics of the first thest but there are definitly some\ndifferences.\n\n\nFor example, we are going to enter a really long word here: vqvfqrczgvjrwniaolqltubqhghdfivxvvksgmfqwagovfcxsuepnaoaqznbdicudijspjzjjndrvnjimlndaxrvqj (Don't worry, that's a made up word.)")
    test_file_2.close 
  end

  def test_clean_up_line
    assert_equal(19, @formatter.clean_up_line("Test   \n   extra spaces.  ").length )
  end

  def test_shorten_lines
    assert_equal("This line is pretty long! It's definitly more than 80 characters! I think we\nshould wrap this around to a new line at least once! ", @formatter.shorten_lines("This line is pretty long! It's definitly more than 80 characters! I think we should wrap this around to a new line at least once!") )
  end

  def test_read_file_to_string
    assert_equal("This is a test file to use with the test suite. \n\nBunch 'o bad formatting here, sorry! ", @formatter.read_file_to_string("test.txt") )
  end

  def test_format_file
    assert_equal("This is a seccond test. It has some characteristics of the first thest but\nthere are definitly some differences.\n\nFor example, we are going to enter a really long word here:\nvqvfqrczgvjrwniaolqltubqhghdfivxvvksgmfqwagovfcxsuepnaoaqznbdicudijspjzjjndrvnjimlndaxrvqj\n(Don't worry, that's a made up word.)", @formatter.format_file("test2.txt") )
  end

  def test_help_message
    assert_equal("\n*HELP* To use this text formatter, run `ruby format-text.rb {file_name}.txt`\n", @formatter.format_file("-h").gsub(/=/, "") )
  end

  def test_error_message
    assert_equal("\n*INVALID INPUT* To use this text formatter, run `ruby format-text.rb {file_name}.txt`\n", @formatter.format_file("not_a_file").gsub(/=/, "") )
  end

  def test_capitalize
    input_string = "this string has sentences."
    expected_output = "This string has sentences."
    assert_equal(expected_output, @formatter.capitalize(input_string))
  end

  def test_capitalize_sentences
    input_string = "this is a seccond test. it has some characteristics of the first."
    expected_output = "This is a seccond test. It has some characteristics of the first."
    assert_equal(expected_output, @formatter.capitalize_sentences(input_string))
  end

  def teardown
    File.delete("test.txt")
    File.delete("test2.txt")
  end
end