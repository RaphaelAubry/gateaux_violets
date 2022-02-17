class Line < ApplicationRecord
  belongs_to :basket
  belongs_to :cake
  belongs_to :flavour
  belongs_to :dimension


  validates :delivery_date, presence: true

  QUANTITY = (1..10)
end
