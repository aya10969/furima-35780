class ApplicationController < ActionController::Base
  before_action :basic_auth


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'admin'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name_furigana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name_furigana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
  end


end

