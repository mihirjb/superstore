class AddAttachmentImageToPhones < ActiveRecord::Migration
  def self.up
    change_table :phones do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :phones, :image
  end
end
