class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :set_layout
  before_action :authenticate_user! # validates that the user's session exists
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!, only: [:update, :destroy]
  # before_action :authenticate_user!, except: [:index, :show, :create]
  
  protected

  def set_layout
    'application'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
