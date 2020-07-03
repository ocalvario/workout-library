class User < ApplicationRecord
    
    has_secure_password
    
    has many :reviews
    has many :exercises, through: :reviews

    validates :email, presence: true, uniqueness: true

end
