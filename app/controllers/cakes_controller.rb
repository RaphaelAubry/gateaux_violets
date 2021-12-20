class CakesController < ApplicationController

  def index
  end

  def new
    @cake = Cake.new
  end

  def create
    @cake = Cake.new(params[:cake])
    @cake.save
  end


  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
