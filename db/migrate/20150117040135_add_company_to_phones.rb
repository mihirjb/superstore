class AddCompanyToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :company, :string
  end
end
