class FlavoursController < ApplicationController
  before_action :set_flavour, only: [:show, :edit, :update, :destroy]

  def index
    @flavours = policy_scope(Flavour)
  end

  def new
    @flavour = Flavour.new
    authorize @flavour
  end

  def create
    @flavour = Flavour.new(flavour_params)
    authorize @flavour
    if @flavour.save
      redirect_to flavours_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @flavour.update(flavour_params)
    authorize @flavour

    redirect_to flavours_path
  end

  def destroy
    @flavour.destroy

    redirect_to flavours_path
  end

  private

  def flavour_params
    params.require(:flavour).permit(:description)
  end

  def set_flavour
    @flavour = Flavour.find(params[:id])
    authorize @flavour
  end

end
