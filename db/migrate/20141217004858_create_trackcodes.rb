class CreateTrackcodes < ActiveRecord::Migration
  def change
    create_table :trackcodes do |t|
      t.string :code
      t.integer :order_id
      t.string :shipping_company
      t.date :shipping_date
      t.string :shipping_city
      t.string :shippingto_city

      t.timestamps
    end
  end
end
