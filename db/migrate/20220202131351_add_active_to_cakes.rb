class AddActiveToCakes < ActiveRecord::Migration[6.1]
  def change
    add_column :cakes, :active, :boolean
  end
end
