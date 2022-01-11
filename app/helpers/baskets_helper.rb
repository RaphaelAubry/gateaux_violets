module BasketsHelper
  def mybasket
    basket = Basket.where(user_id: current_user.id).last
      if basket.status == Basket::STATUS[3]
          basket = Basket.new(user_id: current_user.id, status: Basket::STATUS[0])
          basket.save
      end
      return basket_path(basket)
  end
end
