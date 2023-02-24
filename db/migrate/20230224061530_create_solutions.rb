class CreateSolutions < ActiveRecord::Migration[7.0]
  def change
    create_table :solutions do |t|
      t.string :title
      t.string :kana
      t.text :content

      t.timestamps
    end
  end
end
