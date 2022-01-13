module BasketsHelper

  def mybasket
    basket = Basket.where(user_id: current_user.id).last
  end

  def newbasket
  end

end
