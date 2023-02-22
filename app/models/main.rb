class Main < ApplicationRecord
    has_many :selections, -> { order("kana asc") }, dependent: :destroy
    validates :selection_id, presence: true, uniqueness: true
    accepts_nested_attributes_for :selections, reject_if: proc {|attributes| attributes['text'].blank?}, allow_destroy: true

    def subject
        subject = Subject.find_by(id: self.subject_id)
        return subject.name if subject
    end
end
