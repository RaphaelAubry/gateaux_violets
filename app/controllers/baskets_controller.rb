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
  end

  def edit
  end

  def update
    @total = 0
    @basket.lines.each do |line|
    @total += line.total
    end
    #update filled basket only
    if @total != 0
      @basket.update(basket_params)
    else
      flash[:alert] = "Your basket is empty, you must order a cake to validate your basket"
    end
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
