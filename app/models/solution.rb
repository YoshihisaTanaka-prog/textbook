class Solution < ApplicationRecord
    def hash_format
        return {id: self.id, kana: self.kana, title: self.title, content: self.content}
    end

    def selections
        ret = []
        SolutionSelection.where(solution_id: self.id).each do |ss|
            s = Selection.find_by(id: ss.selection_id)
            ret << s if s
        end
        return ret
    end
end
