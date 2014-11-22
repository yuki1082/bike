class User < ActiveRecord::Base
   attr_accessible :name, :email, :password, :password_confirmation
   validates :name, presence: true, length: {maximum: 50}
   validates :email, presence: true
   has_secure_password

   before_save {|user| user.email = user.email.downcase}
   before_save :create_remember_token

   def create_remember_token
   	self.remember_token = SecureRandom.urlsafe_base64
   end 
 end
