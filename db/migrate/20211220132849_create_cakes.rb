class CreateCakes < ActiveRecord::Migration[6.1]
  def change
    create_table :cakes do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :size

      t.timestamps
    end
  end
end
