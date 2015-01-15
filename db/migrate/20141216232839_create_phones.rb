class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :modelname
      t.integer :impressions_count
      t.string :phonetpye

      t.timestamps
    end
  end
end
