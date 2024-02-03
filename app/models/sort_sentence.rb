class SortSentence < ApplicationRecord
  validates :sentence, presence: true

  def unit
    unit = SortUnit.find_by(id: self.unit_id)
    if unit.blank?
      return ""
    end
    return unit.title
  end

  def hash_format
    return {question: self.shuffle, answer: self.sentence, unit: self.unit}
  end

  private
  def get_words
    words = []
    (1..20).each do |i|
      word = self.send("word#{i}")
      words.push(word) unless word.blank?
    end
    return words
  end

  def shuffle
    words = get_words
    (0..(words.length-1)).each do |i|
      r = rand(words.length)
      keep = words[r]
      words[r] = words[i]
      words[i] = keep
    end
    s = "( "
    words.each_with_index do |word,i|
      if i == 0
        s = s + word
      else
        s = s + " / " + word
      end
      if i == words.length - 1
        s = s + " )"
      end
    end
    return s
  end

end
