class Main < ApplicationRecord
    has_many :selections, -> { order("kana asc") }, dependent: :destroy
    accepts_nested_attributes_for :selections, reject_if: proc {|attributes| attributes['text'].blank?}, allow_destroy: true
end
