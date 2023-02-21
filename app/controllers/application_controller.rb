class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to welcome_path, notice: 'Please Login to proceed'
    end
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :avatar, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :avatar, :password, :current_password)
    end
  end
end
