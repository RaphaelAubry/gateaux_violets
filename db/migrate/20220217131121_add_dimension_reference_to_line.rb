class AddDimensionReferenceToLine < ActiveRecord::Migration[6.1]
  def change
    add_reference :lines, :dimension, null: false, foreign_key: true
  end
end
