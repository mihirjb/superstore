class AddAccounttypeToListings < ActiveRecord::Migration
  def change
    add_column :listings, :accounttype, :string
  end
end
