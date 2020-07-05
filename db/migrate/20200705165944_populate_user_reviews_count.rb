class PopulateUserReviewsCount < ActiveRecord::Migration[6.0]
  def up
    User.find_each do |user|
      User.reset_counters(user.id, :reviews)
    end
  end
end

