class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_for_resource
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def layout_for_resource
    layout 'devise' if devise_controller?
  end

  def configure_permitted_parameters
    added_attrs = [:nickname, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
