class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy]



  def new
    @basket = Basket.new
  end

  def index
    @baskets = Basket.all
  end

  def show
    @total = 0
    @form_token = form_authenticity_token
  end

  def edit
  end

  def update
    @basket.update(basket_params)

    redirect_to basket_path(@basket)
  end

  def destroy
    @basket.destroy

    redirect_to home_path
  end

  private

  def basket_params
    params.require(:basket).permit(:status)
  end

  def set_basket
    @basket = Basket.find(params[:id])
  end
end
