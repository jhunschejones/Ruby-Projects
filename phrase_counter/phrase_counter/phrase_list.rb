module PhraseCounter
  class PhraseList
    def initialize(list={})
      @list = list
    end

    def add_phrase(phrase)
      existing_phrase_count = @list[phrase] || 0
      @list[phrase] = existing_phrase_count + 1
    end
  end
end
