class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :modelname
      t.string :carrier

      t.timestamps
    end
  end
end
