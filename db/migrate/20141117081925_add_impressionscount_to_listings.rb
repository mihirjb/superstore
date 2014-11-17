class AddImpressionscountToListings < ActiveRecord::Migration
  def change
    add_column :listings, :impressions_count, :string
  end
end
