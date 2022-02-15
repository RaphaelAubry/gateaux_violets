class AddFlavourReferenceToLine < ActiveRecord::Migration[6.1]
  def change
    add_reference :lines, :flavour, null: false, foreign_key: true
  end
end
