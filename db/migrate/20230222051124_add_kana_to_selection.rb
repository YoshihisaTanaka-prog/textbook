class AddKanaToSelection < ActiveRecord::Migration[7.0]
  def change
    add_column :selections, :kana, :string
  end
end
