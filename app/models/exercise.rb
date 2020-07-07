class Exercise < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates_presence_of :name, :description

    def set_user!(user)
        self.user_id = user.id
    
        self.save!
    end 

end
