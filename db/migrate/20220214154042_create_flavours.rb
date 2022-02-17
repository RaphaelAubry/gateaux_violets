class CreateFlavours < ActiveRecord::Migration[6.1]
  def change
    create_table :flavours do |t|
      t.string :description

      t.timestamps
    end
  end
end