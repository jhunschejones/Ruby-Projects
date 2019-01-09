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
    assert_equal(["This is a test file to use with the test suite.", "Bunch 'o bad formatting here, sorry!"], @formatter.paragraphs("This is a\ntest file to use with the test suite.\n\n\n\n\nBunch 'o bad formatting here, sorry!"))

    assert_equal(["This is a seccond test. It has some  characteristics of the first test but there are definitly some differences.", "For example, we are going to enter a really long word here: vqvfqrczgvjrwniaolqltubqhghdfivxvvksgmfqwagovfcxsuepnaoaqznbdicudijspjzjjndrvnjimlndaxrvqj (Don't worry, that's a made up word.)"], @formatter.paragraphs("This is\na seccond test. It has some  characteristics of the first test but there are definitly some\ndifferences.\n\n\nFor example, we are going to enter a really long word here: vqvfqrczgvjrwniaolqltubqhghdfivxvvksgmfqwagovfcxsuepnaoaqznbdicudijspjzjjndrvnjimlndaxrvqj (Don't worry, that's a made up word.)"))
  end

  def test_split_on_punctuation
    punctuation = [". ", "! ", "? ", ".... "]

    assert_equal(["this is a test file to use with the test suite. ", "bunch 'o bad formatting here, sorry! "], @formatter.split_on_punctuation("this is a test file to use with the test suite. bunch 'o bad formatting here, sorry! ", punctuation))

    assert_equal(["Wow! ", "This splits sentences! ", "Can you believe it? ", "Maybe.... ", "I guess it works. ", "So it would seem. "], @formatter.split_on_punctuation("Wow! This splits sentences! Can you believe it? Maybe.... I guess it works. So it would seem. ", punctuation))
  end

  def test_sentences
    assert_equal(["Wow! ", "This splits sentences! ", "Can you believe it Mr. Jones? ", "Maybe.... ", "I guess it works. ", "So it would seem. "], @formatter.sentences("Wow! This splits sentences! Can you believe it Mr. Jones? Maybe.... I guess it works. So it would seem. "))

    assert_equal(["Wow! ", "This splits sentences! ", "Can you believe it Mr. and Mrs. Jones? ", "Maybe Fr. Tim did it.... ", "I guess it works. ", "So it would seem. "], @formatter.sentences("Wow! This splits sentences! Can you believe it Mr. and Mrs. Jones? Maybe Fr. Tim did it.... I guess it works. So it would seem. "))
  end

  def teardown
    File.delete("test1.txt")
    File.delete("test2.txt")
  end
end