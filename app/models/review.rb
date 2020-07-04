class Review < ApplicationRecord
    belongs_to :user
    belongs_to :exercise

    validates :content, presence: true

    def set_user!(user)
        self.user_id = user.id
    
        self.save!
    end  

end
