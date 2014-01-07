class AddColumnsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :paypalemail, :string
    add_column :listings, :devicename, :string
    add_column :listings, :devicecarrier, :string
    add_column :listings, :deviceimei, :string
    add_column :listings, :devicecolor, :string
    add_column :listings, :devicestorage, :string
    add_column :listings, :shippingdetails, :string
  end
end
