class Review < ApplicationRecord
    belongs_to :user, counter_cache: true
    belongs_to :exercise, counter_cache: true
    has_many :workouts, through: :exercise 

    validates_presence_of :content

end
