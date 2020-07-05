class Review < ApplicationRecord
    belongs_to :user, counter_cache: true
    belongs_to :exercise, counter_cache: true

    validates :content, presence: true

    def set_user!(user)
        self.user_id = user.id
    
        self.save!
    end 

end
