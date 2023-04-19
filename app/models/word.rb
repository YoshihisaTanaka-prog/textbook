class Word < ApplicationRecord
    validates :word, :mean, presence: true
end
