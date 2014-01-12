class AddPhoneidToListings < ActiveRecord::Migration
  def change
    add_column :listings, :phone_id, :integer
  end
end
