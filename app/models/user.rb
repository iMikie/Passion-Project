class User < ActiveRecord::Base
  include BCrypt

  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :phone_number, :presence => true
  validates :password_hash, :presence => true
end
