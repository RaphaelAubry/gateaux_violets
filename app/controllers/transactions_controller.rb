class TransactionsController < ApplicationController

  def index
    @transactions = policy_scope(Transaction)
  end

  def new
    @basket = Basket.find(params[:basket_id])
    @user = @basket.user
    @address = @user.addresses.last

    @transaction = Transaction.new
    token()
    authorize @transaction
  end

  def create
    @transaction = Transaction.new
    authorize @transaction
    @basket = Basket.find(params[:basket_id])
    @transaction.basket = @basket
    pay(@basket.totalize)
    if @transaction.save
      if current_user.addresses.exists?
        @basket.update(status: Basket::STATUS[3], payment_type: Basket::PAYMENT_TYPE[2])
        UserMailer.with(user: current_user, basket: @basket).basket_completed_email.deliver_now #completed
        redirect_to basket_path(@basket)
      else
        flash[:notice] = t('address_instruction')
        render 'new'
      end
    else
      flash[:notice] = t('payment_instruction')
      redirect_to basket_path(@basket)
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  private

  def token
    @client_token = Braintree::ClientToken.generate
  end

  def pay(basket)
    nonce_from_the_client = params[:payment_method_nonce]
    @gateway = Braintree::Gateway.new(
    environment: Braintree::Configuration.environment,
    merchant_id: Braintree::Configuration.merchant_id,
    public_key: Braintree::Configuration.public_key,
    private_key: Braintree::Configuration.private_key)
    @result = @gateway.transaction.sale(
      :amount => basket,
      :payment_method_nonce => nonce_from_the_client,
      :options => {
        :submit_for_settlement => true
      }
    )
    if @result.success? || @result.transaction
        flash[:notice] = t('success')
    else
        flash[:notice] = t('failure')
    end
  end

end
