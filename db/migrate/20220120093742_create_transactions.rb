class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :basket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
