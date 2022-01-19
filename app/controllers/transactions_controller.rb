class TransactionsController < ApplicationController
  before_action :skip_authorization

  def new
    # pass client_token to your front-end
    @basket = Basket.find(params[:basket_id])
    @address = Address.last
    @gateway = Braintree::Gateway.new(
      environment: Braintree::Configuration.environment,
      merchant_id: Braintree::Configuration.merchant_id,
      public_key: Braintree::Configuration.public_key,
      private_key: Braintree::Configuration.private_key
    )
    @client_token = Braintree::ClientToken.generate
    @customer = current_user
  end

  def create
    # nonce_from_the_client = params[:payment_method_nonce]
    # Use payment method nonce here...
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
    @basket = Basket.find(params[:basket_id])
    @basket.update(basket_params)
  end

  private

  def basket_params
    params.require(:basket).permit(:status, :payment_type)
  end
end
