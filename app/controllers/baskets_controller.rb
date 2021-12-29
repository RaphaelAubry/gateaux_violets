class BasketsController < ApplicationController
  def new
    @basket = Basket.new
  end

  def index
    @baskets = Basket.all
  end

  def show
    @basket = Basket.find(params[:id])
  end

  def destroy
    @basket = Basket.find(params[:id])
    @basket.destroy

    redirect_to home_path
  end
end
