# == Schema Information
#
# Table name: phones
#
#  id                 :integer          not null, primary key
#  modelname          :string(255)
#  carrier            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Phone < ActiveRecord::Base
  
  has_many :listings
   has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "30x30>" }, :default_url => "/images/:style/missing.png"
end
