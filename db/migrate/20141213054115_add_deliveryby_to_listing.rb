class AddDeliverybyToListing < ActiveRecord::Migration
  def change
    add_column :listings, :deliveryby, :string
  end
end
