class ApplicationController < ActionController::Base
  protect_from_forgery

  def login
    authenticate
    redirect_to posts_path if session[:admin]
  end

  def logout
    session[:admin] = false
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      if username == CONFIG['username'] and password == CONFIG['password']
        session[:admin] = true
        true
      end
    end
  end
end
