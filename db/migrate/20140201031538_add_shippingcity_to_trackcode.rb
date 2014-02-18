class AddShippingcityToTrackcode < ActiveRecord::Migration
  def change
    add_column :trackcodes, :shipping_city, :string
  end
end
