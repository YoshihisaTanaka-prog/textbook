class SortUnit < ApplicationRecord
  validates :title, presence: true
  validates :grade, presence: true
end
