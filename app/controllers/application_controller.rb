class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic_auth

  include SessionsHelper

  private

  def basic_auth
    if ENV["BASIC_AUTH_ENABLE"]
      authenticate_or_request_with_http_basic do |username, password|
       username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 
      end
    end
  end


  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_tasks = user.tasks.count
  end
  
  
end