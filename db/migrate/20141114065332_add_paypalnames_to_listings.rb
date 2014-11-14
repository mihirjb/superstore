class AddPaypalnamesToListings < ActiveRecord::Migration
  def change
    add_column :listings, :paypalfname, :string
    add_column :listings, :paypallname, :string
  end
end
