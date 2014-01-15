# == Schema Information
#
# Table name: listings
#
#  id                  :integer          not null, primary key
#  headline            :string(255)
#  description         :text
#  devicecondition     :string(255)
#  askprice            :integer
#  expirydate          :date
#  modified            :boolean
#  accessories         :string(255)
#  country             :string(255)
#  itemlocation        :string(255)
#  shipinternationally :boolean
#  paypalconfirmed     :boolean
#  returnsallowed      :boolean
#  returnpolicy        :text
#  created_at          :datetime
#  updated_at          :datetime
#  vendor_id           :integer
#  paypalemail         :string(255)
#  devicename          :string(255)
#  devicecarrier       :string(255)
#  deviceimei          :string(255)
#  devicecolor         :string(255)
#  devicestorage       :string(255)
#  shippingdetails     :string(255)
#

class Listing < ActiveRecord::Base
  
  validates :headline, :presence => {:message => 'Heading cannot be blank, Listing not saved'}
  validates :description, :presence => {:message => 'Atleast write a few words about your phone.'}
  
  
  validates :paypalemail, :presence => {:message => 'Paypal email cannot be blank, Listing not saved'}
  
  
  
  
  belongs_to :phone
  has_one :vendor
  has_many :comments, :dependent => :destroy
  has_many :assets, :dependent => :destroy
  
  accepts_nested_attributes_for :assets
  
private 
 def self.get_listing_author(listing_vendor_id)
   @author = Vendor.find(listing_vendor_id)
 end  
 
 def self.get_listing_author_profile(listing_vendor_id)
   @profile = Profile.find_by_vendor_id(listing_vendor_id)
 end 
  

end
