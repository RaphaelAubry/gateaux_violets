class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :surname
      t.string :address
      t.string :addition_address
      t.string :zip_code
      t.string :city
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
