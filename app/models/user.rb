class User < ApplicationRecord
    
    has_secure_password
    
    has many :reviews
    has many :exercises, through: :reviews
end
