class BasketsController < ApplicationController
  before_action :set_basket, only: [:show, :edit, :update, :destroy, :invoice ]

  def new
    @basket = Basket.new
  end

  def index
    @baskets = policy_scope(Basket)
    if params[:query].present?
        sql_query = " \
        baskets.status @@ :query \
        OR Cast(baskets.created_at AS varchar) @@ :query \
        OR Cast(baskets.id AS varchar) @@ :query \
        OR baskets.payment_type @@ :query \
        OR users.email @@ :query \
      "
      @baskets = policy_scope(Basket).joins(:user).where(sql_query, query: "%#{params[:query]}%")
    end
  end

  def show
    @total = 0
    @address = Address.find_by(user_id: current_user.id)
    @client_token = token()
  end

  def edit
  end

  def update
    @total = @basket.totalize
    #update filled basket only
    if @total != 0
      case @basket.status
        when Basket::STATUS[0] #order
          if params[:basket][:sales_rules] == "1"
            @basket.update(basket_params)
            redirect_to basket_path(@basket)
          else
            params[:basket][:status] = Basket::STATUS[0]
            @basket.update(basket_params)
            redirect_to basket_path(@basket)
            flash[:alert] = t('sales_rules_instructions')
          end
        when Basket::STATUS[1] #delivery
          @basket.update(basket_params)
          redirect_to basket_path(@basket)
        when Basket::STATUS[2] #payment
          if current_user.addresses.exists?
            @basket.update(basket_params)
            UserMailer.with(user: current_user, basket: @basket).basket_completed_email.deliver_now #completed
            redirect_to basket_path(@basket)
          else
            if params[:basket][:status] == Basket::STATUS[1]
              @basket.update(basket_params)
              UserMailer.with(user: current_user, basket: @basket).basket_completed_email.deliver_now #completed
              redirect_to basket_path(@basket)
            else
              flash[:alert] = t('address_request')
              redirect_to new_address_path
            end
          end
        when Basket::STATUS[3] #completed
            @basket.update(basket_params)
            redirect_to basket_path(@basket)
        end
    else
      redirect_to cakes_path
      flash[:alert] = t('empty_basket_instruction')
    end
  end

  def destroy
    @basket.destroy

    redirect_to home_path
  end


  def invoice
  end

  private

  def basket_params
    params.require(:basket).permit(:status, :payment_type, :sales_rules)
  end

  def set_basket
    @basket = Basket.find(params[:id])
    authorize @basket
  end

  def token
    Braintree::ClientToken.generate
  end

end
