class Solution < ApplicationRecord
    def hash_format
        return {id: self.id, kana: self.kana, title: self.title, content: self.content}
    end
end
