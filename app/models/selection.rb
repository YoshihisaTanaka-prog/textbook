class Selection < ApplicationRecord
    belongs_to :main

    def next
        main = Main.find_by(selection_id: self.id)
        if main
            return main
        else
            return nil
        end
    end

    def children_base
        if self.next
            return self.next.selections
        else
            return []
        end
    end

    def solutions
        ret = []
        SolutionSelection.where(selection_id: self.id).each do |ss|
            solution = Solution.find_by(id: ss.solution_id)
            ret << solution if solution
        end
        return ret
    end
end
