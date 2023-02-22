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
end
