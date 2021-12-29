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

  private

  def line_params
    params.require(:line).permit(:quantity, :total, :cake_id, :basket_id)
  end

end
