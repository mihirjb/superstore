class CreateSpecifications < ActiveRecord::Migration
  def change
    create_table :specifications do |t|
      t.string :manufacturer
      t.string :providers
      t.string :speed
      t.string :ram
      t.string :storage
      t.string :microsd
      t.string :resolution
      t.string :displaysize
      t.string :features
      t.string :size
      t.string :weight
      t.string :formfactor
      t.string :colors
      t.string :megapixels
      t.string :camfeatures
      t.string :phonetype
      t.string :cariiers
      t.string :networks
      t.string :releasedate
      t.string :wifi
      t.string :bluetooth
      t.string :gps
      t.string :fourg
      t.string :microusb
      t.string :audiojack
      t.string :radio
      t.string :speakerphone
      t.string :lion
      t.string :replace
      t.string :batreplace

      t.timestamps
    end
  end
end
