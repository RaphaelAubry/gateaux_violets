class CakesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_cake, only: [:show, :edit, :update, :destroy]

  def index
    @cakes = policy_scope(Cake)
  end

  def new
    @cake = Cake.new
    authorize @cake
  end

  def create
    @cake = Cake.new(cake_params)
    authorize @cake
    @cake.save

    redirect_to home_path
  end

  def show
  end

  def edit
  end

  def update
    if @cake.lines == []
    @cake.update(cake_params)
    else
      flash[:alert] = "The cake has been ordered, can't modify it"
    end

    redirect_to cake_path
  end

  def destroy
    if @cake.lines == []
    @cake.destroy
    else
      flash[:alert] = "The cake has been ordered, can't delete it"
    end

    redirect_to home_path
  end

  private

  def cake_params
    params.require(:cake).permit(:name, :description, :price, :size, :photo)
  end

  def set_cake
    @cake = Cake.find(params[:id])
    authorize @cake
  end
end
