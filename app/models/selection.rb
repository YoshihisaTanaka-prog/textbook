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

    def all_children
        ret = self.children_base
        self.children_base.each do |child|
            child.all_children.each do |c|
                ret << c
            end
        end
        logger.debug ret
        return ret
    end

    def solutions
        ret = []
        SolutionSelection.where(selection_id: self.id).each do |ss|
            solution = Solution.find_by(id: ss.solution_id)
            ret << solution if solution
        end
        return ret
    end

    def all_solutions
        ret = self.solutions
        self.all_children.each do |child|
            child.solutions.each do |solution|
                ret << solution
            end
        end
        ret = ret.sort_by{|x| x.kana }
        return ret
    end

    def all_solutions_id
        ret = []
        self.all_solutions.each do |solution|
            ret << solution.id
        end
        return ret
    end
end
