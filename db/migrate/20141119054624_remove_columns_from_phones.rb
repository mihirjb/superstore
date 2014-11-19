class RemoveColumnsFromPhones < ActiveRecord::Migration
  def change
    remove_column :phones, :carrier, :string
    remove_column :phones, :market, :string
  end
end
