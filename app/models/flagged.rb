class Flagged < ApplicationRecord
  belongs_to :workout
  belongs_to :review
end
