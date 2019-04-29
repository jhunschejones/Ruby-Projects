require 'test/unit'
require './format-text.rb'

class TextFormatterTests < Test::Unit::TestCase
  def setup
    @formatter = TextFormatter.new()

    test_file_1 = File.new('test1.txt', 'w')
    test_file_1.write("This is a\ntest file to use with the test suite.\n\n\n\n\nBunch 'o bad formatting here, sorry!")
    test_file_1.close 

    test_file_2 = File.new('test2.txt', 'w')
    test_file_2.write("This is\na seccond test. It has some  characteristics of the first test but there are definitly some\ndifferences.\n\n\nFor example, we are going to enter a really long word here: vqvfqrczgvjrwniaolqltubqhghdfivxvvksgmfqwagovfcxsuepnaoaqznbdicudijspjzjjndrvnjimlndaxrvqj (Don't worry, that's a made up word.)")
    test_file_2.close 
  end

  def test_read_file
    assert_equal("This is a\ntest file to use with the test suite.\n\n\n\n\nBunch 'o bad formatting here, sorry!", @formatter.read_file("test1.txt"))
  end

  def test_whitespace
    assert_equal("Test\nextra spaces.", @formatter.whitespace("Test   \n   extra spaces.  "))
  end

  def test_paragraphs
    assert_equal(["This is a test file to use with the test suite. ", "Bunch 'o bad formatting here, sorry! "], @formatter.paragraphs("This is a\ntest file to use with the test suite.\n\n\n\n\nBunch 'o bad formatting here, sorry!"))

    assert_equal(["This is a seccond test. It has some  characteristics of the first test but there are definitly some differences. ", "For example, we are going to enter a really long word here: vqvfqrczgvjrwniaolqltubqhghdfivxvvksgmfqwagovfcxsuepnaoaqznbdicudijspjzjjndrvnjimlndaxrvqj (Don't worry, that's a made up word.) "], @formatter.paragraphs("This is\na seccond test. It has some  characteristics of the first test but there are definitly some\ndifferences.\n\n\nFor example, we are going to enter a really long word here: vqvfqrczgvjrwniaolqltubqhghdfivxvvksgmfqwagovfcxsuepnaoaqznbdicudijspjzjjndrvnjimlndaxrvqj (Don't worry, that's a made up word.)"))
  end

  def test_split_on_punctuation
    punctuation = [". ", "! ", "? ", ".... "]

    assert_equal(["this is a test file to use with the test suite. ", "bunch 'o bad formatting here, sorry! "], @formatter.split_on_punctuation("this is a test file to use with the test suite. bunch 'o bad formatting here, sorry! ", punctuation))

    assert_equal(["Wow! ", "This splits sentences! ", "Can you believe it? ", "Maybe.... ", "I guess it works. ", "So it would seem. "], @formatter.split_on_punctuation("Wow! This splits sentences! Can you believe it? Maybe.... I guess it works. So it would seem. ", punctuation))
  end

  def test_join_exceptions
    exceptions = ["Mr. ", "Mrs. ", "Ms. ", "Miss. ", "Sr. ", "Fr. "]

    assert_equal(["Wow! ", "This splits sentences! ", "Can you believe it Mr. Jones? ", "Maybe.... ", "I guess it works. ", "So it would seem. "], @formatter.join_exceptions(["Wow! ", "This splits sentences! ", "Can you believe it Mr. ", "Jones? ", "Maybe.... ", "I guess it works. ", "So it would seem. "], exceptions))
  end

  def test_sentences
    assert_equal(["Wow! ", "This splits sentences! ", "Can you believe it Mr. Jones? ", "Maybe.... ", "I guess it works. ", "So it would seem. "], @formatter.sentences("Wow! This splits sentences! Can you believe it Mr. Jones? Maybe.... I guess it works. So it would seem. "))

    assert_equal(["Wow! ", "This splits sentences! ", "Can you believe it Mr. and Mrs. Jones? ", "Maybe Fr. Tim did it.... ", "I guess it works. ", "So it would seem. "], @formatter.sentences("Wow! This splits sentences! Can you believe it Mr. and Mrs. Jones? Maybe Fr. Tim did it.... I guess it works. So it would seem. "))
  end

  def test_capitalize
    assert_equal("This sentence is not capitalized. ", @formatter.capitalize("this sentence is not capitalized. "))
  end

  def test_short_lines
    assert_equal("This line is pretty long! It's definitly more than 80 characters! I think we\nshould wrap this around to a new line at least once! ", @formatter.short_lines("This line is pretty long! It's definitly more than 80 characters! I think we should wrap this around to a new line at least once! "))

    assert_equal("This is a seccond test. It has some characteristics of the first test but there\nare definitly some differences. For example, we are going to enter a really\nlong word here:\nvqvfqrczgvjrwniaolqltubqhghdfivxvvksgmfqwagovfcxsuepnaoaqznbdicudijspjzjjndrvnjimlndaxrvqj\n(Don't worry, that's a made up word.) ", @formatter.short_lines("This is a seccond test. It has some characteristics of the first test but there are definitly some differences. For example, we are going to enter a really long word here: vqvfqrczgvjrwniaolqltubqhghdfivxvvksgmfqwagovfcxsuepnaoaqznbdicudijspjzjjndrvnjimlndaxrvqj (Don't worry, that's a made up word.)"))
  end

  def test_formatter
    assert_equal("This is a seccond test. It has some characteristics of the first test but there\nare definitly some differences. \n\nFor example, we are going to enter a really long word here:\nvqvfqrczgvjrwniaolqltubqhghdfivxvvksgmfqwagovfcxsuepnaoaqznbdicudijspjzjjndrvnjimlndaxrvqj\n(Don't worry, that's a made up word.) ", @formatter.format("test2.txt"))
  end
  
  def teardown
    File.delete("test1.txt")
    File.delete("test2.txt")
  end
end