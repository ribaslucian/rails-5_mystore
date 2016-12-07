class ApplicationController < ActionController::Base
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  # devise auth config
  before_action :authenticate_user!

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery
end
