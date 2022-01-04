class Line < ApplicationRecord
  belongs_to :basket
  belongs_to :cake

  QUANTITY = (1..10)

end
