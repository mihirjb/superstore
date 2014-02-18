class AddIndexToOrders < ActiveRecord::Migration
  def change
     add_index :orders, :listing_id
      add_index :orders, :vendor_id
      add_index :orders, :seller_id
  end
end
