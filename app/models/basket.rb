class Basket < ApplicationRecord
  belongs_to :user
  has_many :lines, dependent: :destroy

  STATUS = ["basket", "delivery", "payment"]

  PAYMENT_TYPE = ["Bank transfer", "Cash"]

  IBAN = "FR76 1234 5647 9191 58"
end
