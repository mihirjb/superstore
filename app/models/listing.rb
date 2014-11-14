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
#  status              :string(255)
#  phone_id            :integer
#  terms               :string(255)
#  moddetails          :string(255)
#

class Listing < ActiveRecord::Base
  is_impressionable
  
  validates :headline, :presence => {:message => 'Heading cannot be blank, Listing not saved'}
  validates :headline, :length => {:in => 6..60}
  
  validates :description, :presence => {:message => 'Atleast write a few words about your phone.'}
  validates :description, :length => {:in => 6..140}
  validates :askprice, :presence => {:message => 'Ask Price cannot be left blank for obvious reasons.'}
  
  validates :accessories, :presence => {:message => 'List of accessories needed to be declared. Write none for nothing.'}
  validates :devicecondition, :presence => {:message => 'Device  condition has to be specified'}
  validates :deviceimei, :presence => {:message => 'IMEI number needed for verification'}
  validates :devicecolor, :presence => {:message => 'Color cannot be blank, Listing not saved'}
  validates :devicestorage, :presence => {:message => 'Storage cannot be blank, Listing not saved'}
  
  validates :itemlocation, :presence => {:message => 'Atleast write a few words about your phone.'}
  
  

  
  validates :paypalemail, :presence => {:message => 'Paypal email cannot be blank, Listing not saved'}
  
  
  
  
  belongs_to :phone, touch: true
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
  
  def self.get_recent_count(vendorid)
    @count = 0
    listing = Listing.find_all_by_vendor_id(vendorid)
    listing.each do |l|
     if Time.now.day - l.updated_at.to_date.day <= 0 
       @count = @count + 1
     else
       @count = @count
     end
   end
		
  end
  
  
 def self.get_paypal_status(paypalemail, lid)
   require 'paypal-sdk-adaptiveaccounts'
   @api = PayPal::SDK::AdaptiveAccounts::API.new(
     :mode      => "live",  # Set "live" for production
     :username => ENV['PAYPAL_UNAME'],
     :password => ENV['PAYPAL_PWD'],
     :signature => ENV['PAYPAL_SIGNATURE'],
     :app_id => ENV['PAYPAL_APPID'],
     :device_ipaddress => "127.0.0.1")
   # Build request object
   @get_verified_status = @api.build_get_verified_status({
     :emailAddress => paypalemail,
     :matchCriteria => "NONE" })

   # Make API call & get response
   @get_verified_status_response = @api.get_verified_status(@get_verified_status)

   # Access Response
   if @get_verified_status_response.success?
     Listing.find(lid).update_column("paypalstatus", "Verified")
     @get_verified_status_response.accountStatus
     @get_verified_status_response.countryCode
     @get_verified_status_response.userInfo
   else
     Listing.find(lid).update_column("paypalstatus", "Unverified")
     @get_verified_status_response.error
   end
 end
 
 
end
