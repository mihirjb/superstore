class AddShippingdateToTrackcode < ActiveRecord::Migration
  def change
    add_column :trackcodes, :shipping_date, :date
  end
end
