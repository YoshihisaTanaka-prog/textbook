class Subject < ApplicationRecord
    def hash_format
        selection_id = - self.id
        main = Main.find_by(selection_id: selection_id)
        main_id = 0
        main_id = main.id if main
        return {subject: self.name, main_id: main_id}
    end
end
