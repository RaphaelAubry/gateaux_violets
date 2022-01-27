class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :baskets
  has_many :addresses
  has_many :transactions, through: :baskets

  has_one_attached :avatar

  def last_basket
    basket = Basket.where(user_id: id).last
  end

  def basket_opened?
    basket = Basket.where(user_id: id).last
    if !basket.nil?
      basket.payment_type.nil? ? true : false
    end
  end

  def active_basket_items
    count = 0
    basket = Basket.where(user_id: id).last
    if basket.payment_type.nil?
      basket.lines.each do |line|
        count += line.quantity
      end
    end
    return count
  end

end
