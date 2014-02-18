class AddTermsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :terms, :string
  end
end
