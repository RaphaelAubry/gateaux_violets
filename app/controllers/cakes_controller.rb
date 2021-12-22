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

    redirect_to cakes_path
  end


  def show
    @cake = Cake.find(params[:id])
  end

  def edit
    @cake = Cake.find(params[:id])
  end

  def update
    @cake = Cake.find(params[:id])
  end

  def destroy
    @cake = Cake.find(params[:id])
  end

  private

  def cake_params
    params.require(:cake).permit(:name, :description, :price, :size)
  end
end
