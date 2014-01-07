class AddVendoridToListings < ActiveRecord::Migration
  def change
    add_column :listings, :vendor_id, :integer
  end
end
