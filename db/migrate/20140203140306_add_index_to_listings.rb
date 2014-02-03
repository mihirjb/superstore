class AddIndexToListings < ActiveRecord::Migration
  def change
          add_index :listings, :id
          add_index :listings, :vendor_id
  end
end
