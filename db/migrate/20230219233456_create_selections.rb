class CreateSelections < ActiveRecord::Migration[7.0]
  def change
    create_table :selections do |t|
      t.string :text
      t.integer :main_id

      t.timestamps
    end
  end
end
