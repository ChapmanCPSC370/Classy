class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  autocomplete :department, :name
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:school_search_id, :school_id, :bAdmin, :bAmbassador, :bio, :imageurl, :major, :major_id, :minor, :first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  	end
  	devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:school_search_id, :school_id, :bAdmin, :bAmbassador, :bio, :imageurl, :major, :major_id, :minor, :first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  	end
  end
end
