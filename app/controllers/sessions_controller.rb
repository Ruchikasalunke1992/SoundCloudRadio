require 'soundcloud'

class SessionsController < ApplicationController
	before_filter :set_current_user
	before_filter :set_redirects

	def set_redirects
		@base_url_local = 'http://localhost:3000/callback'
		@base_url_heroku = 'http://sradio.herokuapp.com/callback'
	end

	def new
    # create client object with app credentials
    client = Soundcloud.new(:client_id => 'f5f27bd7924819d49bd18ce5789e288a',
    	:client_secret => '51a9a1e4bd75af7b101e0fd6c988626e',
    	:redirect_uri => @base_url_heroku)
    
    # TODO: Add try to make sure that the access token is retrieved successfully
    error = params[:error]
    if error
    	flash[:notice] = "Error: #{error}"
    else
      # exchange authorization code for access token
      code = params[:code]
      access_token = client.exchange_token(:code => code)
      
      # create client object with access token
      client = Soundcloud.new(:access_token => access_token[:access_token])
      
      # make an authenticated call
      current_user = client.get('/me')
      
      @user = User.find_by_username(current_user.username)
      
      params[:user] = {
      	:username => current_user.username,
      	:session_token => access_token[:access_token],
      }
      
      if @user
      	@user.session_token = params[:user][:session_token]
      	@user.save!
      else
      	User.create!(params[:user])
      end

      session[:session_token] = params[:user][:session_token]
  end

    # TODO: Use a proper homepage
    redirect_to sessions_path
end

def create
    # create client object with app credentials
    client = Soundcloud.new(:client_id => 'f5f27bd7924819d49bd18ce5789e288a',
    	:client_secret => '51a9a1e4bd75af7b101e0fd6c988626e',
    	:redirect_uri => @base_url_heroku)
    
    # redirect user to authorize URL
    redirect_to client.authorize_url
end

def destroy
	session[:session_token] = nil
	redirect_to sessions_path
end
end
