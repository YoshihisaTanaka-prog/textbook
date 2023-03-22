class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string :word
      t.string :mean
      t.integer :student_id
      t.integer :time

      t.timestamps
    end
  end
end
