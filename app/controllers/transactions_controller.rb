class TransactionsController < ApplicationController
  before_action :skip_authorization

  def new
    # pass client_token to your front-end
    @basket = Basket.find(params[:basket_id])
    @address = Address.last
    @client_token = Braintree::ClientToken.generate
    @customer = current_user
  end

  def create
    # nonce_from_the_client = params[:payment_method_nonce]
    # Use payment method nonce here...
    result = gateway.transaction.sale(
      :amount => "10.00",
      :payment_method_nonce => 'fake-valid-no_billing-address-nonce',
      :device_data => device_data_from_the_client,
      :options => {
        :submit_for_settlement => true
      }
    )
      if result.success? || result.transaction
        puts "success transaction"
     else
       puts "fail transaction"
     end
  end
end
