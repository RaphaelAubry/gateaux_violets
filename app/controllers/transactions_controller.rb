class TransactionsController < ApplicationController
  before_action :skip_authorization

  def index
  end

  def new
    @basket = Basket.find(params[:basket_id])
    @user = @basket.user
    @address = @user.addresses.last

    @transaction = Transaction.new
    @client_token = Braintree::ClientToken.generate
  end

  def create
    @transaction = Transaction.new
    @basket = Basket.find(params[:basket_id])
    @transaction.basket = @basket
    @transaction.save
  end

  def show
       @gateway = Braintree::Gateway.new(
    environment: Braintree::Configuration.environment,
    merchant_id: Braintree::Configuration.merchant_id,
    public_key: Braintree::Configuration.public_key,
    private_key: Braintree::Configuration.private_key)
    @result = @gateway.transaction.sale(
      :amount => "1000.00",
      :payment_method_nonce => 'fake-valid-nonce',
      :options => {
        :submit_for_settlement => true
      }
    )
    if @result.success? || @result.transaction
        flash[:notice] = 'success'
    else
         flash[:notice] = 'read more'
    end
  end

end
