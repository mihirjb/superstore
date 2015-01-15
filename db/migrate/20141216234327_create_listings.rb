class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :headline
      t.string :description
      t.integer :askprice
      t.date :expirydate
      t.boolean :modified
      t.string :accessories
      t.string :country
      t.string :itemlocation
      t.boolean :shipinternationally
      t.boolean :paypalconfirmed
      t.boolean :returnsallowed
      t.text :returnspolicy
      t.integer :user_id
      t.string :paypalemail
      t.string :devicename
      t.string :devicestorage
      t.string :devicecarrier
      t.string :deviceimei
      t.string :devicecolor
      t.string :devicecondition
      t.string :shippingdetails
      t.string :status
      t.integer :phone_id
      t.string :terms
      t.string :moddetails
      t.string :paypalstatus
      t.string :paypalfname
      t.string :paypallname
      t.integer :impressions_count
      t.string :accounttype

      t.timestamps
    end
  end
end
