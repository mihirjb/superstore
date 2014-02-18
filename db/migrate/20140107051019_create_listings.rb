class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :headline
      t.text :description
      t.string :devicecondition
      t.integer :askprice
      t.date :expirydate
      t.boolean :modified
      t.string :accessories
      t.string :country
      t.string :itemlocation
      t.boolean :shipinternationally
      t.boolean :paypalconfirmed
      t.boolean :returnsallowed
      t.text :returnpolicy

      t.timestamps
    end
  end
end
