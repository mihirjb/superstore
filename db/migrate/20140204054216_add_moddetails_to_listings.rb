class AddModdetailsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :moddetails, :string
  end
end
