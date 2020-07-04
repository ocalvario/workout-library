class AddUsertoExercises < ActiveRecord::Migration[6.0]
  def change
    add_reference :exercises, :user, index: true
  end
end
