class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy]

  def new
    @basket = Basket.new
  end

  def index
    @baskets = policy_scope(Basket)

  end

  def show
    @total = 0
    @address = Address.find_by(user_id: current_user.id)
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
      if current_user.addresses.exists?
        @basket.update(basket_params)
      else
        flash[:alert] = "Please enter an address"
      end
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
    params.require(:basket).permit(:status, :payment_type)
  end

  def set_basket
    @basket = Basket.find(params[:id])
    authorize @basket
  end
end
