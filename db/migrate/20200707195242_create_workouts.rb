class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :user_id
      t.string :first_exercise
      t.string :second_exercise
      t.string :third_exercise
      t.string :fourth_exercise
      t.string :fifth_exercise
      t.timestamps
    end
  end
end

