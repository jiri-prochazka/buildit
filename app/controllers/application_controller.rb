class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected

  def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :name, :surname, :phone, :password, addresses_attributes: [:street,:city,:zip,:country]) }
	  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :name, :surname, :phone, :current_password, :password, :password_confirmation) }
	end
end
