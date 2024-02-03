class SortSentence < ApplicationRecord
  validates :sentence, presence: true

  def get_words
    words = []
    (1..20).each do |i|
      word = self.send("word#{i}")
      words.push(word) unless word.blank?
    end
    return words
  end

  def unit
    unit = Unit.find_by(id: self.unit_id)
    return unit unless unit.blank?
  end
end
