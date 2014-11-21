class AddPictureToComments < ActiveRecord::Migration
  def self.up
      add_attachment :comments, :picture
    end

    def self.down
      remove_attachment :comments, :picture
    end
end
