class Song
  # initialize runs when .new() is called
  def initialize(lyrics, title)
    # this @ syntax makes it a class variable
    @lyrics = lyrics
    @title = title
  end

  # this allows the variable to be able to be 
  # called outside the class
  attr_reader :title

  def sing_me_a_song()
    @lyrics.each {|line| puts line }
  end
end

happy_bday = Song.new(
  [
  "Happy birthday to you", 
  "I don't want to get sued",
  "So I'll stop right there."
  ],
  "Happy Birthday"
)

bulls_on_parade = Song.new(
  ["They rally around the family", "With pockets full of shells"],
  "Bulls on Parade"
)

puts "Title: #{happy_bday.title}"
happy_bday.sing_me_a_song()

puts "Title: #{bulls_on_parade.title}"
bulls_on_parade.sing_me_a_song()