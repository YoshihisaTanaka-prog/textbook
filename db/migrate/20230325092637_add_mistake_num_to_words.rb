class AddMistakeNumToWords < ActiveRecord::Migration[7.0]
  def change
    add_column :words, :mistake_num, :integer
  end
end
