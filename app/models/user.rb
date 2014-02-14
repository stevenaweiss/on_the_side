class User < ActiveRecord::Base

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    self.has_secure_password()
  
end    