class User < ApplicationRecord
   include Flipper::Identifier

   has_secure_password

   validates :email , presence: true, uniqueness: true
   validates :password, confirmation: true
end
