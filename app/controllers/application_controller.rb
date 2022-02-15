class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:show ]
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :set_locale

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
  flash[:alert] = "You are not authorized to perform this action."
  redirect_to(home_path)
  end

  # add flash types ?
  # add_flash_types :info, :error, :warning

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def set_locale
    I18n.locale = I18n.default_locale
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :avatar, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password, :avatar)}
  end

end
