class Line < ApplicationRecord
  belongs_to :basket
  belongs_to :cake
  belongs_to :flavour
  belongs_to :dimension

  validates :dimension, presence: true
  validates :delivery_date, presence: true
  validates :option, format: { with: /(^[A-Z]{1}$)|(^[A-Z|0-9]{1}[\w|\W|0-9]{0,3}\S$)|(^[0-9]{1,3}$)|(^[A-Z|0-9{1}]{1}([\w|\W|0-9]){4,}\S$)/ }, allow_blank: true


  QUANTITY = (1..10)
end
