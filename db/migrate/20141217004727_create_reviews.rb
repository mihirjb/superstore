class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :author_id
      t.text :reviewbody
      t.boolean :thumbsup
      t.integer :profile_id
      t.integer :order_id

      t.timestamps
    end
  end
end
