class AddIndexToTrackcodes < ActiveRecord::Migration
  def change
      add_index :trackcodes, :order_id
  end
end
