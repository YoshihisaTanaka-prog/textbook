class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :kana
      t.string :affiliation
      t.integer :birthday
      t.integer :current_time, null: false, default: 0

      t.timestamps
    end
  end
end
