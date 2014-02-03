class AddIndexToPhones < ActiveRecord::Migration
    def change
        add_index :phones, :modelname
        add_index :phones, :carrier
      end
end
