
class User < ActiveRecord::Base
  include BCrypt

  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :phone_number, :presence => true
  validates :password, :presence => true
  validates :password, length: { minimum: 6 }

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
