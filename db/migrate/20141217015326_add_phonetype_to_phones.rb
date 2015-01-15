class AddPhonetypeToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :phonetype, :string
    remove_column :phones, :phonetpye, :string
  end
end
