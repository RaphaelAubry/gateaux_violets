class AddDeliveryDateToLine < ActiveRecord::Migration[6.1]
  def change
    add_column :lines, :delivery_date, :datetime
  end
end
