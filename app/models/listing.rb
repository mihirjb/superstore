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
#

class Listing < ActiveRecord::Base
  
  has_one :vendor
end
