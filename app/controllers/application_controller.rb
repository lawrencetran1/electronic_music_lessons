class ApplicationController < ActionController::Base
	include StaticPagesHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  respond_to :json

  def default_serializer_options
    {root: false}
  end

  def angular
    render 'layouts/application'
  end

  def index
  end
end
