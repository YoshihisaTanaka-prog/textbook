class Subject < ApplicationRecord
    def hash_format
        selection_id = - self.id
        main = Main.find_by(selection_id: selection_id)
        main_hash = {}
        main_hash = main.hash_format if main
        return {subject: self.name, main: main_hash}
    end
end
