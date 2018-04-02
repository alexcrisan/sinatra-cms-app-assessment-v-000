class User < ActiveRecord::Base
  has_many :beats
  has_secure_password
end
