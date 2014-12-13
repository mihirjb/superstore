class AddPickupaddressToListing < ActiveRecord::Migration
  def change
    add_column :listings, :pickupaddress, :string
  end
end
