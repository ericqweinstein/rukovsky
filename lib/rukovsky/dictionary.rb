class MarkovDictionary
  attr_reader :dictionary

  def initialize
    @depth             = 3
    @dictionary        = {}
    @word_boundary     = /([.?!])|[\s]+/
    @sentence_boundary = /(?<=[.!?])\s+/
  end

  def add_word(current_word, next_word)
    @dictionary[current_word] ||= []
    @dictionary[current_word] << next_word
  end

  def parse_corpus(file)
    lines = read_corpus(file)
    lines.map! { |sentence| sentence.gsub(/["()]/, "") }
    lines.each do |sentence|
      sentence.split(@word_boundary).each_cons(@depth) do |words|
        self.add_word(words[0..-2], words[-1])
      end
    end
  end

  class DictionaryError < Exception; end

  private

  def read_corpus(file)
    if File.exists?(file)
      File.open(file, 'r').read.split(@sentence_boundary)
    else
      raise DictionaryError.new("Could not find #{file}.")
    end
  end
end

