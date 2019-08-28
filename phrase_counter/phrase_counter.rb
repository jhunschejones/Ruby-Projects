require_relative './phrase_counter/cli'
require_relative './phrase_counter/phrase_list'

module PhraseCounter
  class << self
    def run(input)
      puts input
      PhraseCounter::CLI.new
      input.each_line.lazy { |line| PhraseCounter.parse_line(line) }
    end

    def parse_line(line)

      puts line
    end
  end
end
