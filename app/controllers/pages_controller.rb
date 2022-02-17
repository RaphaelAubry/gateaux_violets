class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:identification, :sales_legal, :contact, :delivery ]
  def home
  end

  def identification
  end

  def delivery
  end

  def contact
  end

  def sales_legal
  end
end
