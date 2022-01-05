class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    if @address.save
      redirect_to baskets_path
    else
      render 'new'
    end
  end

  def index
  end

  def show
    @address = Address.find_by(user_id: current_user.id)
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)

    redirect_to baskets_path
  end

  def destroy
  end

  private

  def address_params
    params.require(:address).permit(:name, :surname, :address, :addition_address, :zip_code, :city, :type, :user_id)
  end
end
