class DimensionsController < ApplicationController
    before_action :set_dimension, only: [ :edit, :update, :destroy]

  def index
    @dimensions = policy_scope(Dimension)
  end

  def new
    @dimension = Dimension.new
    authorize @dimension
  end

  def create
    @dimension = Dimension.new(dimension_params)
    authorize @dimension
    if @dimension.save
      redirect_to dimensions_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @dimension.update(dimension_params)
    authorize @dimension

    redirect_to dimensions_path
  end

  def destroy
    @dimension.destroy

    redirect_to dimensions_path
  end

  private

  def dimension_params
    params.require(:dimension).permit(:level, :share)
  end

  def set_dimension
    @dimension = Dimension.find(params[:id])
    authorize @dimension
  end


end
