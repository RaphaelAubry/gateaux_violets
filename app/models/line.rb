class Line < ApplicationRecord
  belongs_to :basket
  belongs_to :cake

  include ActionView::Helpers::NumberHelper

  QUANTITY = (1..10)

   def total_2d
    number_with_precision(total, precision: 2)
  end
end
