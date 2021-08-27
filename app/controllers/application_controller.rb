class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters , if: :devise_controller?

  def basic_auth
    authenticate_or_request_with_http_basic do |username , password|
      username == ENV["FURIMA_USER"] && password == ENV["FURIMA_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up , keys:[ :nickname, :first_name, :last_name , :first_name_reading, :last_name_reading , :birthday])
  end

end
