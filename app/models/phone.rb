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
  is_impressionable :counter_cache => true, :column_name => :impressions_count
  
  
  has_many :listings
   has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "30x30>" }, :default_url => "/images/phones/:style/missing.png"
   validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


end
