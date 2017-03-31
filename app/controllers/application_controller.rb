class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
    #针对devise的特殊设置
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:status])
    end
end
