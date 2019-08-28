module PhraseCounter
  class CLI
    def initialize
      ARGF.each_line.lazy { |line| PhraseCounter.parse_line(line) }
    end
  end
end
