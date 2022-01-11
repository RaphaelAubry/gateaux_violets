class Basket < ApplicationRecord
  belongs_to :user
  has_many :lines, dependent: :destroy

  STATUS = ["basket", "delivery", "payment", "complete"]

  PAYMENT_TYPE = ["Bank transfer", "Cash"]

  IBAN = "FR76 1234 5647 9191 58"

  def totalize
    total = 0
    self.lines.each do |line|
      total += line.total
    end
    return total
  end
end
