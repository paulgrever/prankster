class User < ActiveRecord::Base
  validates :first_name, :last_name, :user_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  has_secure_password
end
