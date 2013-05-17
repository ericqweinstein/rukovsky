class Poem
  def initialize(dictionary)
    @dictionary = dictionary
    @depth      = 3
  end

  def line_count
    rand(31) + 3
  end

  class NoPoem < Exception; end

  # Add line_count lines to the poem
  # (range: 3 to 33, inclusive)
  def generate(lines)
    raise NoPoem.new("Your source file is empty!") if @dictionary.dictionary.empty?

    poem = []
    lines.times do
      poem << generate_line(word_count)
    end

    poem.join(' ')
  end

  private

  # Add word_count words to the line
  # (range: 5 to 15, inclusive)
  def generate_line(words)
    raise NoPoem.new("Your source file is empty!") if @dictionary.dictionary.empty?

    line = []
    line.concat(seed_word)
    (words - 1).times do
      word = following_word(line.last(@depth))
      if punctuation?(word)
        line[-1] = line.last.dup << word
        line << following_word(seed_word)
      elsif word.nil?
        line << following_word(seed_word)
      else
        line << word
      end
    end

    line.pop(line.length - words)
    line.join(' ')

    line << "\n"
  end

  def word_count
    rand(11) + 5
  end

  def seed_word
    words = @dictionary.dictionary.keys
    words[rand(words.size)]
  end

  def following_word(previous_word)
    @dictionary.dictionary.fetch(previous_word, []).sample
  end

  def punctuation?(word)
    word =~ /[.?!]/
  end
end

