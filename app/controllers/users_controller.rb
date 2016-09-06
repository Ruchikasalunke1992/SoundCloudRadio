class UsersController < ApplicationController
  def new
    # default: render 'new' template
    @user = User.new
  end
end
