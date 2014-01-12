# == Schema Information
#
# Table name: profiles
#
#  id            :integer          not null, primary key
#  fullname      :string(255)
#  paypalemail   :string(255)
#  displayname   :string(255)
#  timezone      :string(255)
#  country       :string(255)
#  market        :string(255)
#  location      :string(255)
#  aboutme       :string(255)
#  twitterhandle :string(255)
#  websiteurl    :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  vendor_id     :integer
#

class Profile < ActiveRecord::Base
  
  validates_presence_of :fullname
  validates_presence_of :displayname
  validates_presence_of :paypalemail
  validates_presence_of :country
  validates_presence_of :timezone
  validates_presence_of :location
  
  
  
  
  
  
  
  belongs_to :vendor
  has_many :reviews, :dependent => :destroy
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "30x30>" }, :default_url => "/images/:style/missing.png"
  
end
