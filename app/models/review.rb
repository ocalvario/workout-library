class Review < ApplicationRecord
    belongs_to :user
    belongs_to :exercise

    validates :content, presence: true

end
