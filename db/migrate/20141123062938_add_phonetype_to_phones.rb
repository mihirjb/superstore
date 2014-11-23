class AddPhonetypeToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :phonetype, :string
  end
end
