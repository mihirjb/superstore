class Phone < ActiveRecord::Base
  
  has_many :listings
   has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "30x30>" }, :default_url => "/images/:style/missing.png"
end
