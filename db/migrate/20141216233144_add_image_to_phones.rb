class AddImageToPhones < ActiveRecord::Migration
  def self.up
      add_attachment :phones, :image
    end

    def self.down
      remove_attachment :phones, :image
    end
end
