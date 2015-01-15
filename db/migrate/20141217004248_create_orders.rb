class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :devicename
      t.string :devicecarrier
      t.string :deviceimei
      t.string :ordertotal
      t.string :selleraddress
      t.date :orderdate
      t.datetime :ordertime
      t.integer :seller_id
      t.text :shipping_address
      t.integer :pptransactionid
      t.text :params

      t.timestamps
    end
  end
end
