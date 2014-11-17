class RemoveColumnFromPhones < ActiveRecord::Migration
  def change
    remove_column :phones, :impressions_count, :string
  end
end
