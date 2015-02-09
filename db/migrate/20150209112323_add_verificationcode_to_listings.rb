class AddVerificationcodeToListings < ActiveRecord::Migration
  def change
    add_column :listings, :verification_code, :string
  end
end
