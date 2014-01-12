class RemoveColumnFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :vendor_id, :string
  end
end
