class AddVendoridToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :vendor_id, :integer
  end
end
