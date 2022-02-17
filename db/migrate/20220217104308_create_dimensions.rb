class CreateDimensions < ActiveRecord::Migration[6.1]
  def change
    create_table :dimensions do |t|
      t.integer :share
      t.integer :level

      t.timestamps
    end
  end
end
