class User < ActiveRecord::Base
  validates :username, :email, length: {
    minimum: 6,
    maximum: 35,
    too_short: "must have at least %{count} letters",
    too_long: "must have at least %{count} letters"
  }, uniqueness: true
  
  validates :password, format: {
    with: /\A[a-zA-Z0-9!@#\$%^&\(\)]+\z/,
    message: "only allows a-z, 0-9 and !@#$%^&*()"
  }
  
end