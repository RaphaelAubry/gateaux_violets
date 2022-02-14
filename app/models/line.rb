class Line < ApplicationRecord
  belongs_to :basket
  belongs_to :cake
  has_one :flavour

  validates :delivery_date, presence: true

  QUANTITY = (1..10)
end
