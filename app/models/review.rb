class Review < ApplicationRecord
    belongs_to :user, counter_cache: true
    belongs_to :exercise, counter_cache: true
    has_many :flaggeds
    has_many :workouts, through: :flaggeds
    validates_presence_of :content
end
