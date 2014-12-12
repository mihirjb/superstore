class AddParamsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :params, :string
  end
end
