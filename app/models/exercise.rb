class Exercise < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :name, uniqueness: true
    validates_presence_of :name, :description

end
