class BasketsController < ApplicationController
  def new
    @cake = Cake.find(params[:cake_id])
  end
end
