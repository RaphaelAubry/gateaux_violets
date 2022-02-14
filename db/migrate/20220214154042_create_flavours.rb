class CreateFlavours < ActiveRecord::Migration[6.1]
  def change
    create_table :flavours do |t|
      t.string :description
      t.references :line, null: false, foreign_key: true

      t.timestamps
    end
  end
end
