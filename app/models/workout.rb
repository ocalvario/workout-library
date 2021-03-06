class Workout < ApplicationRecord
  belongs_to :user
  has_many :exercises
  has_many :flaggeds
  has_many :reviews, through: :flaggeds

  validates :name, uniqueness: true
  validates_presence_of :name, :first_exercise, :second_exercise, :third_exercise, :fourth_exercise, :fifth_exercise, :review_ids

end