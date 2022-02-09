class CakesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_cake, only: [:show, :edit, :update, :destroy]

  def index
    params[:query].present? ? @cakes = policy_scope(Cake).search(params[:query]) : @cakes = policy_scope(Cake)
  end

  def new
    @cake = Cake.new
    authorize @cake
  end

  def create
    @cake = Cake.new(cake_params)
    authorize @cake
    if @cake.save
      redirect_to home_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    status = @cake.active
    @cake.lines == [] || params[:cake][:active] != status.to_s ? @cake.update(cake_params) : flash[:alert] = "The cake has been ordered, can't modify it"

    redirect_to cake_path
  end

  def destroy
    @cake.lines == [] ? @cake.destroy : flash[:alert] = "The cake has been ordered, can't delete it"

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
