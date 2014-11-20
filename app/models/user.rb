class User < ActiveRecord::Base
  attr_accessible :session_token, :username
end
