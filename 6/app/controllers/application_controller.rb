# Created 4-10-19 by Anna Yu
# Edited 4-14-19 by Anna Yu wanted to add username parameter
# Edited by Celia Tang 4-15-19: added initialize of search var
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_global_search_variable

  def set_global_search_variable
    @q = Book.ransack(params[:q])
  end

  protected

  # Created by 4-14-19 by Anna Yu to check all parameters with username
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end


end
