class AddIndexToReviews < ActiveRecord::Migration
  def change
      add_index :reviews, :profile_id
  end
end
