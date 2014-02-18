class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :subject
      t.text :commentbody
      t.integer :vendor_id
      t.integer :listing_id

      t.timestamps
    end
  end
end
