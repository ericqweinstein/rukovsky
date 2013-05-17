require_relative 'rukovsky/dictionary'
require_relative 'rukovsky/poem'

module Rukovsky
  class Dictionary
    def initialize(file)
      @dictionary = MarkovDictionary.new
      @poem       = Poem.new(@dictionary)
      @file       = file
    end

    def dictionary
      @dictionary.dictionary
    end

    def read_in(file)
      @dictionary.parse_corpus(@file)
    end

    def generate_poem
      @poem.generate(@poem.line_count)
    end
  end
end

