# == Schema Information
#
# Table name: assets
#
#  id                 :integer          not null, primary key
#  listing_id         :integer
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Asset < ActiveRecord::Base
  belongs_to :listing 
  has_attached_file :image,
      :styles => {
        :thumb=> "100x100#",
        :small  => "300x300>",
        :large => "600x600>"
          }
          validates_attachment :image,
          :presence => true,
            :size => { :in => 0..5.megabytes }
            
          validates_attachment_content_type :image, :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/, :message => 'file type is not allowed (only jpeg/png/gif images)'
  
end
