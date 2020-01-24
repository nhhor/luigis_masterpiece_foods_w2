class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?



  def authorize
    # binding.pry
    if !current_user
      flash[:alert] = "Please sign in to do that."
      redirect_to '/'
    end
  end

  def authorize_admin
    if current_user.admin != true
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to request.referrer
    else
      
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:admin, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:admin, :email, :password, :current_password)}
  end

end
