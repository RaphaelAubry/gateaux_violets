class AddStatusToBasket < ActiveRecord::Migration[6.1]
  def change
    add_column :baskets, :status, :string
  end
end
