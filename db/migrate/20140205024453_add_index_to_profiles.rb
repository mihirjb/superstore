class AddIndexToProfiles < ActiveRecord::Migration
  def change
      add_index :profiles, :vendor_id
  end
end
