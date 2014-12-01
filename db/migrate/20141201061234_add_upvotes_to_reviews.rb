class AddUpvotesToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :upvotes, :integer
    add_column :reviews, :downvotes, :integer
  end
end
