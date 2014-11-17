class RemoveColumnFromListings < ActiveRecord::Migration
  def change
    remove_column :listings, :impressions_count, :string
  end
end
