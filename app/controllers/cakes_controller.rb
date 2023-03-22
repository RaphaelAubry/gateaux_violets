class CakesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_cake, only: [:show, :edit, :update, :destroy]

  def index
    @cakes = params[:query].present? ? policy_scope(Cake).where('description like ?', params[:query]) : policy_scope(Cake)
    @cakes = policy_scope(Cake) if @cakes.empty?
  end

  def new
    @cake = Cake.new
    authorize @cake
  end

  def create
    @cake = Cake.new(cake_params)
    @cake.active = true
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
    @cake.lines == [] || params[:cake][:active] != status.to_s ? @cake.update(cake_params) : flash[:alert] = t('cake_ordered_modification_instruction')

    redirect_to cake_path
  end

  def destroy
    if @cake.lines == []
      @cake.destroy
      flash[:notice] = t('cake_deleted')
    else
      flash[:alert] = t('cake_ordered_deletion_instruction')
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
