# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # deviseのアクションにストロングパラメータを適用する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # ストロングパラメータを定義
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username image profile guest_flg])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username profile password image remove_image])
  end
end
