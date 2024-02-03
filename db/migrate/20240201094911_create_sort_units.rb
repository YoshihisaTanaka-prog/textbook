class CreateSortUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :sort_units do |t|
      t.string :title
      t.integer :grade

      t.timestamps
    end
  end
end
