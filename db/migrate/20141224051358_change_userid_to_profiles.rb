class ChangeUseridToProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :user_id, :string
    add_column :profiles, :user_id, :integer
  end
end
