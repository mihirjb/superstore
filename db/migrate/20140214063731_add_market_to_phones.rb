class AddMarketToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :market, :string
  end
end
