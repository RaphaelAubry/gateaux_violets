class TransactionsController < ApplicationController
  def new
    gateway = Braintree::Gateway.new(
    :environment => :sandbox,
    :merchant_id => ENV["BRAINTREE_MERCHANT_ID"],
    :public_key => ENV["BRAINTREE_PUBLIC_KEY"],
    :private_key => ENV["BRAINTREE_PRIVATE_KEY"],
    )
    # pass client_token to your front-end
    @client_token = gateway.client_token.generate(
    #:customer_id => a_customer_id
    )
  end

  def create
  end
end
