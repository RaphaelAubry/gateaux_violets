class LinesController < ApplicationController
  before_action :set_line, only: [:edit, :update, :destroy]
  before_action :set_cake, only: [:new, :create]

  def index
  end

  def new
    @line = Line.new
    authorize @line
  end

  def create
    @line = Line.new(line_params)
    authorize @line
    #select current basket
    @basket = Basket.where(user_id: current_user.id, payment_type: nil).last
    if @basket.nil?
      @basket = Basket.new(user_id: current_user.id, status: Basket::STATUS[0])
      @basket.save
    end
    @line.basket = @basket
    @line.total = calcTotal(@cake.price)
    @line.cake = @cake
    if @line.save
      redirect_to basket_path(@basket)
    else
      render 'new'
    end
  end

  def edit
    @basket = Basket.find(@line.basket_id)
    @cake = Cake.find(@line.cake_id)
  end

  def update
    @basket = Basket.find(@line.basket_id)
    @line.total = calcTotal(@line.cake.price)
    @line.update(line_params)

    redirect_to basket_path(@basket)
  end

  def destroy
    @basket = Basket.find(@line.basket_id)
    @line.destroy

    redirect_to basket_path(@basket)
  end

  private

  def line_params
    params.require(:line).permit(:quantity, :total, :cake_id, :basket_id, :delivery_date)
  end

  def set_line
    @line = Line.find(params[:id])
    authorize @line
  end

  def set_cake
    @cake = Cake.find(params[:cake_id])
  end

  def calcTotal(price)
    return price * line_params[:quantity].to_i
  end
end
