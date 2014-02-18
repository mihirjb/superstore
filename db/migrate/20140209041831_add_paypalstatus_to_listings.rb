class AddPaypalstatusToListings < ActiveRecord::Migration
  def change
    add_column :listings, :paypalstatus, :string
  end
end
