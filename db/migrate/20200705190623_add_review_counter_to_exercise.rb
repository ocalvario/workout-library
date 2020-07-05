class AddReviewCounterToExercise < ActiveRecord::Migration[6.0]
  def change
    add_column :exercises, :reviews_count, :integer, default: 00
  end
end