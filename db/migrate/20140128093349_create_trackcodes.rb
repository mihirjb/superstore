class CreateTrackcodes < ActiveRecord::Migration
  def change
    create_table :trackcodes do |t|
      t.string :code
      t.integer :order_id

      t.timestamps
    end
  end
end
