class AddPaypaltransidToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pptransactionid, :string
  end
end
