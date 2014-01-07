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
  
  has_one :vendor
end
