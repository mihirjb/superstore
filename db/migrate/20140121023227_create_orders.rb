class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :vendor_id
      t.string :devicename
      t.string :devicecarrier
      t.string :deviceimei
      t.string :ordertotal
      t.string :selleraddress
      t.date :orderdate
      t.datetime :ordertime

      t.timestamps
    end
  end
end
