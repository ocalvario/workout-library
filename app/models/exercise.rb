class Exercise < ApplicationRecord
    has_many :reviews
    validates :name, uniqueness: true
    validates_presence_of :name, :description

    scope :bodyweight, -> { where(:equipment => 'Body Weight') }
    

end


