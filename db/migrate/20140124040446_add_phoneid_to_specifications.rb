class AddPhoneidToSpecifications < ActiveRecord::Migration
  def change
    add_column :specifications, :phone_id, :integer
  end
end
