class AddPaymentTypeToBasket < ActiveRecord::Migration[6.1]
  def change
    add_column :baskets, :payment_type, :string
  end
end
