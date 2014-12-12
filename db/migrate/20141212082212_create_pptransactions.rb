class CreatePptransactions < ActiveRecord::Migration
  def change
    create_table :pptransactions do |t|
      t.string :params
      t.integer :order_id
      t.integer :transaction_id
      t.string :status

      t.timestamps
    end
  end
end
