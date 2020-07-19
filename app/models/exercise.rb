class Exercise < ApplicationRecord
    has_many :reviews
    belongs_to :user
    validates :name, uniqueness: true
    validates_presence_of :name, :description
end


