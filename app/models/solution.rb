class Solution < ApplicationRecord
    def hash_format
        return {title: self.title, content: self.content}
    end
end
