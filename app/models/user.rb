class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :workouts
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true

    def self.find_or_create_by_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.username = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end

end
