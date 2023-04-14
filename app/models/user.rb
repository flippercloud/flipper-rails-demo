class User < ApplicationRecord
   include Flipper::Identifier

   has_secure_password

   validates :email , presence: true, uniqueness: true
   validates :password, confirmation: true

   enum beverage: { unspecified: 0, water: 1, tea: 2, coffee: 3 }
end
