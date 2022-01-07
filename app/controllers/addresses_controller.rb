class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update, :destroy]
  before_action :set_basket, only: [:create, :update, :destroy]

  def new
    @address = Address.new
    authorize @address
  end

  def create
    @address = Address.new(address_params)
     authorize @address
    @address.user_id = current_user.id
    if @address.save
      redirect_to basket_path(@basket)
    else
      render 'new'
    end
  end

  def show
    @address = Address.find_by(user_id: current_user.id)
  end

  def edit
  end

  def update
    @address.update(address_params)

    redirect_to basket_path(@basket)
  end

  def destroy
    @address.destroy

    redirect_to basket_path(@basket)
  end

  private

  def address_params
    params.require(:address).permit(:name, :surname, :address, :addition_address, :zip_code, :city, :type, :phone, :user_id)
  end

  def set_address
    @address = Address.find(params[:id])
    authorize @address
  end

  def set_basket
    @basket = Basket.where(user_id: current_user.id).last
  end
end
