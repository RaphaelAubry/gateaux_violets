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
      redirect_from_address_to()
    else
      render 'new'
    end
  end

  def show
    @address = Address.find_by(user_id: current_user.id)
    authorize @address
  end

  def edit
  end

  def update
    @address.update(address_params)
    if @address.save
      redirect_from_address_to()
    else
      render 'new'
    end


  end

  def destroy
    @address.destroy

    redirect_from_address_to()
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

  def redirect_from_address_to
    if current_user.basket_opened?
        basket = current_user.last_basket
        case basket.status
          when Basket::STATUS[0]
            redirect_to basket_path(basket)
          when Basket::STATUS[1]
            redirect_to basket_path(basket)
          when Basket::STATUS[2]
            if basket.payment_type.nil?
            redirect_to new_basket_transaction_path(current_user.last_basket)
            else
            redirect_to home_path
            end
          end
      else
      redirect_to home_path
      end
  end
end
