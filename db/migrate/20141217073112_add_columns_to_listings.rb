class AddColumnsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :deliveryby, :string
    add_column :listings, :pickupaddress, :string
  end
end
