class AddImpressionscountToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :impressions_count, :string
  end
end
