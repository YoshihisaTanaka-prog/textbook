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
            ret = []
            self.next.selections.each do |selection|
                ret.push(selection)
            end
            return ret
        else
            return []
        end
    end

    def all_children
        ret = self.children_base
        self.children_base.each do |child|
            child.all_children.each do |c|
                ret.push(c)
            end
        end
        return ret
    end

    def solutions
        ret = []
        SolutionSelection.where(selection_id: self.id).each do |ss|
            solution = Solution.find_by(id: ss.solution_id)
            ret << solution if solution
        end
        ret = ret.sort_by{|x| x.kana }
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

    def hash_format
        next_id = nil
        next_id = self.next.id if self.next
        all_solutions = []
        self.all_solutions.each do |solution|
            all_solutions << solution.hash_format
        end
        my_solutions = []
        self.solutions.each do |solution|
            my_solutions << solution.hash_format
        end
        return {text: self.text, solutions: all_solutions, my_solutions: my_solutions, next_id: next_id}
    end
end
