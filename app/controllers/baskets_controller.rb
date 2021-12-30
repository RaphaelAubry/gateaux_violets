class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :destroy]

  def new
    @basket = Basket.new
  end

  def index
    @baskets = Basket.all
  end

  def show
  end

  def destroy
    @basket.destroy

    redirect_to home_path
  end

  private

  def set_basket
    @basket = Basket.find(params[:id])
  end
end
