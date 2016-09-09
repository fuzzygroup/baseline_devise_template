class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # before_filter :configure_permitted_parameters, if: :devise_controller?
  #
  # def configure_permitted_parameters
  #    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me) }
  #    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
  #    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :first_name, :last_name, :email, :password, :password_confirmation, :current_password) }
  #  end
  
  before_action :configure_permitted_parameters, if: :devise_controller?

   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :first_name, :last_name, :password, :password_confirmation, :remember_me])
   end
end
