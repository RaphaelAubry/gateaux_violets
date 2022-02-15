class AddSalesRulesToBasket < ActiveRecord::Migration[6.1]
  def change
    add_column :baskets, :sales_rules, :boolean
  end
end
