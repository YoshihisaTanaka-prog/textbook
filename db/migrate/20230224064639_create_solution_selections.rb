class CreateSolutionSelections < ActiveRecord::Migration[7.0]
  def change
    create_table :solution_selections do |t|
      t.integer :solution_id
      t.integer :selection_id

      t.timestamps
    end
  end
end
