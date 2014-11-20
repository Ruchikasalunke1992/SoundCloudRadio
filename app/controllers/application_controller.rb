class ApplicationController < ActionController::Base
	protect_from_forgery
	before_filter :set_admin

	def set_admin
		base_url_local = 'http://localhost:3000/'
		base_url_heroku = 'https://sradio.herokuapp.com/'
	end
	def set_current_user
		@current_user ||= session[:session_token] && User.find_by_session_token(session[:session_token])
	end
end
