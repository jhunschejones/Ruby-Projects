require 'test/unit'
require './format-text_r2.rb'

class TextFormatterTests < Test::Unit::TestCase

  def setup
    @formatter = TextFormatter.new()

    test_file_1 = File.new('test.txt', 'w')
    test_file_1.write("This is a\ntest file to use with the test suite.\n\n\n\n\nBunch 'o bad formatting here, sorry!")
    test_file_1.close 

    test_file_2 = File.new('test2.txt', 'w')
    test_file_2.write("This is\na seccond test. It has some  characteristics of the first test but there are definitly some\ndifferences.\n\n\nFor example, we are going to enter a really long word here: vqvfqrczgvjrwniaolqltubqhghdfivxvvksgmfqwagovfcxsuepnaoaqznbdicudijspjzjjndrvnjimlndaxrvqj (Don't worry, that's a made up word.)")
    test_file_2.close 
  end

  def test_valid_input_help_message
    assert_equal({ message: "HELP", valid: false }, @formatter.valid_input("-h") )
  end

  def test_valid_input_error_message
    assert_equal({ message: "INVALID INPUT", valid: false }, @formatter.valid_input("not_a_file") )
  end

  def test_read_file
    assert_equal("This is a\ntest file to use with the test suite.\n\n\n\n\nBunch 'o bad formatting here, sorry!", @formatter.read_file("test.txt"))
  end

  def test_collapse_newlines
    test_text = @formatter.read_file("test.txt")
    assert_equal("This is a test file to use with the test suite. \n\nBunch 'o bad formatting here, sorry! ", @formatter.collapse_newlines(test_text))
  end

  def test_remove_extra_spaces
    assert_equal("Test extra spaces.", @formatter.remove_extra_spaces("Test   \n   extra spaces.  "))
  end

  def test_shorten_lines
    assert_equal("This line is pretty long! It's definitly more than 80 characters! I think we \nshould wrap this around to a new line at least once!", @formatter.shorten_lines("This line is pretty long! It's definitly more than 80 characters! I think we should wrap this around to a new line at least once!"))
  end

  # this very close to a full integration test
  def test_format_text_from_file
    assert_equal("This is a seccond test. It has some characteristics of the first test but there \nare definitly some differences.\n\nFor example, we are going to enter a really long word here: \nvqvfqrczgvjrwniaolqltubqhghdfivxvvksgmfqwagovfcxsuepnaoaqznbdicudijspjzjjndrvnjimlndaxrvqj \n(Don't worry, that's a made up word.)", @formatter.format_text_from_file("test2.txt"))
  end

  def teardown
    File.delete("test.txt")
    File.delete("test2.txt")
  end
end