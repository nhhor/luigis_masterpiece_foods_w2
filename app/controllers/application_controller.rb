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
    if user_signed_in? != false
      flash[:alert] = "Please sign in as admin to do that."
      redirect_to '/'
      if current_user.admin != true
        flash[:alert] = "Sorry, only admins are allowed to do that."
        redirect_to request.referrer
      end
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:admin, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:admin, :email, :password, :current_password)}
  end

end
