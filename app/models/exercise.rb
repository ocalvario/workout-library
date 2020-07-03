class Exercise < ApplicationRecord
    has_many :reviews
    has_many :users, through: reviews

    validates :name, presence: true

    scope :no_equip, -> {where (equipment: 'none')} 

end
