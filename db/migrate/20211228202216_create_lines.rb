class CreateLines < ActiveRecord::Migration[6.1]
  def change
    create_table :lines do |t|
      t.integer :quantity
      t.decimal :total
      t.references :basket, null: false, foreign_key: true
      t.references :cake, null: false, foreign_key: true

      t.timestamps
    end
  end
end
