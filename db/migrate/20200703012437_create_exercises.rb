class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :body_part
      t.string :exercise_group
      t.string :equipment
      t.string :description
      t.timestamps
    end
  end
end
