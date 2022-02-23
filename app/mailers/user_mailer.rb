class UserMailer < ApplicationMailer
  def basket_payment_request_email
    @user = params[:user]
    mail(to: @user.email, subject: "Votre panier")
  end

  def basket_completed_email
    @user = params[:user]
    @basket = params[:basket]
    @url = "localhost:3000/baskets/#{@basket.id}"
    mail(to: @user.email, subject: "Votre commande n° #{@basket.id} est validée")
  end
end
