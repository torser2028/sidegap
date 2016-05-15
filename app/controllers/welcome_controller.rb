class WelcomeController < ApplicationController
  helper_method :resource_name, :resource, :devise_mapping
	skip_before_filter :authenticate_user!, only: :login

  def index
    @stories = Story.latest
  end

  def resource_name
    :user
  end

  def login
  	@resource ||= User.new
  	render :layout => false
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
