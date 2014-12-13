class ChangeParamsFormatInOrders < ActiveRecord::Migration
  def up
    change_column :orders, :params, :text
  end

  def down
    change_column :orders, :params, :string
  end
 
end
