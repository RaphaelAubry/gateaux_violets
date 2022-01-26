class Basket < ApplicationRecord
  belongs_to :user
  has_many :lines, dependent: :destroy
  has_many :transactions, dependent: :destroy

  STATUS = ["basket", "delivery", "payment", "complete"]

  PAYMENT_TYPE = ["Bank transfer", "Cash", "Card"]

  IBAN = "FR76 1234 5647 9191 58"

  def totalize
    total = 0
    self.lines.each do |line|
      total += line.total
    end
    return total
  end




  #def self.newbasket(user)
    #basket = self.where(user_id: user.id).last
    #if basket.totalize != 0
   #   basket = self.new(user_id: user.id, status: "basket")
   #   basket.save
   # end
   # return basket
  #end
end
