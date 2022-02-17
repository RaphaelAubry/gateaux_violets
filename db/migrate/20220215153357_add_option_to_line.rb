class AddOptionToLine < ActiveRecord::Migration[6.1]
  def change
    add_column :lines, :option, :string
  end
end
