class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def set_current_user
    @current_user ||= session[:session_token] && User.find_by_session_token(session[:session_token])
    @local_redirect = 'http://localhost:3000/callback'
    @heroku_redirect = 'http://sradio.herokuapp.com/callback'
  end
end
