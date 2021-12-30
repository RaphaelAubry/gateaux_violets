class LinesController < ApplicationController


  def new
    @cake = Cake.find(params[:cake_id])
    @line = Line.new
  end

  def create
    @line = Line.new(line_params)
    @cake = Cake.find(params[:cake_id])
    @basket = Basket.where(user_id: current_user.id).last
    if @basket == nil
      @basket = Basket.new(user_id: current_user.id)
      @basket.save
    end
    @line.basket = @basket
    @line.cake = @cake
    if @line.save
      redirect_to home_path
    else
      render 'new'
    end
  end

  def edit
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    @basket = Basket.find(@line.basket_id)
    @line.update(line_params)

    redirect_to basket_path(@basket)
  end

  def destroy
    @line = Line.find(params[:id])
    @basket = Basket.find(@line.basket_id)
    @line.destroy

    redirect_to basket_path(@basket)
  end

  private

  def line_params
    params.require(:line).permit(:quantity, :total, :cake_id, :basket_id)
  end

end
