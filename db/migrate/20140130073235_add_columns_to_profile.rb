class AddColumnsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :address, :text
    add_column :profiles, :phone, :string
  end
end
