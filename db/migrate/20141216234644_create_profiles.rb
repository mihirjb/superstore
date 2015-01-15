class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fullname
      t.string :paypalemail
      t.string :displayname
      t.string :timezone
      t.string :country
      t.string :market
      t.string :location
      t.string :aboutme
      t.string :twitterhandle
      t.string :websiteurl
      t.string :user_id
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
