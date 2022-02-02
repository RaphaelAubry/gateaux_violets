class CakesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_cake, only: [:show, :edit, :update, :destroy]

  def index
    @cakes = policy_scope(Cake)
    if params[:query].present?
      @cakes = Cake.search(params[:query])
    end
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
    @cake.lines == [] || params[:cake][:active] ? @cake.update(cake_params) : flash[:alert] = "The cake has been ordered, can't modify it"

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
    params.require(:cake).permit(:name, :description, :price, :size, :photo, :active)
  end

  def set_cake
    @cake = Cake.find(params[:id])
    authorize @cake
  end
end
