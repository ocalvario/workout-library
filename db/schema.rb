# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_07_195242) do

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "body_part"
    t.string "exercise_group"
    t.string "equipment"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "reviews_count", default: 0
    t.index ["user_id"], name: "index_exercises_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "exercise_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_reviews_on_exercise_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.integer "reviews_count", default: 0
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "first_exercise"
    t.string "second_exercise"
    t.string "third_exercise"
    t.string "fourth_exercise"
    t.string "fifth_exercise"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
