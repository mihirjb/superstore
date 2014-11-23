class RemoveColumnFromPhones < ActiveRecord::Migration
  def change
    remove_column :phones, :type, :string
  end
end
