class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # ストロングパラメータを定義
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :image])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end
end
