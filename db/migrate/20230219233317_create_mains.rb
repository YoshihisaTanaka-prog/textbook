class CreateMains < ActiveRecord::Migration[7.0]
  def change
    create_table :mains do |t|
      t.integer :subject_id
      t.text :question
      t.integer :selection_id

      t.timestamps
    end
  end
end
