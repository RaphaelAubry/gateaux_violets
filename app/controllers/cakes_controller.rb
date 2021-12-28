class CakesController < ApplicationController

  def index
    @cakes = Cake.all
  end

  def new
    @cake = Cake.new
  end

  def create
    @cake = Cake.new(cake_params)
    @cake.save

    redirect_to home_path
  end


  def show
    @cake = Cake.find(params[:id])
  end

  def edit
    @cake = Cake.find(params[:id])
  end

  def update
    @cake = Cake.find(params[:id])
    @cake.update(cake_params)

    redirect_to cake_path
  end

  def destroy
    @cake = Cake.find(params[:id])
    @cake.destroy

    redirect_to home_path
  end

  private

  def cake_params
    params.require(:cake).permit(:name, :description, :price, :size)
  end
end
