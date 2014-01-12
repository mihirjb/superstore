class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :author_id
      t.integer :vendor_id
      t.text :reviewbody
      t.boolean :thumbsup

      t.timestamps
    end
  end
end
