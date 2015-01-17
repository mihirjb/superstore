# == Schema Information
#
# Table name: phones
#
#  id                 :integer          not null, primary key
#  modelname          :string(255)
#  impressions_count  :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  phonetype          :string(255)
#

class Phone < ActiveRecord::Base
  
  has_attached_file :image, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    }

    # Validate the attached image is image/jpg, image/png, etc
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    validates :modelname, uniqueness: true    
    
end
