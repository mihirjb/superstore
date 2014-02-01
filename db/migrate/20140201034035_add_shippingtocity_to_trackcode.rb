class AddShippingtocityToTrackcode < ActiveRecord::Migration
  def change
    add_column :trackcodes, :shippingto_city, :string
  end
end
