class User < ApplicationRecord
    
    has_secure_password
    
    has_many :reviews
    has_many :exercises, through: :reviews

    validates :email, presence: true, uniqueness: true

end
