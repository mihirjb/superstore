class AddSlugToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :slug, :string
    add_index :phones, :slug, unique: true
  end
end
