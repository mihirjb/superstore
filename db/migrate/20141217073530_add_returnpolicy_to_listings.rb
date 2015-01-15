class AddReturnpolicyToListings < ActiveRecord::Migration
  def change
    add_column :listings, :returnpolicy, :string
  end
end
