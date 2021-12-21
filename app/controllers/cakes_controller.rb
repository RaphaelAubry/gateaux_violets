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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def cake_params
    params.require(:cake).permit(:name, :description, :price, :size)
  end
end
