class AddShippingcompanyToTrackcodes < ActiveRecord::Migration
  def change
    add_column :trackcodes, :shipping_company, :string
  end
end
