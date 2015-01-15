# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  devicename       :string(255)
#  devicecarrier    :string(255)
#  deviceimei       :string(255)
#  ordertotal       :string(255)
#  selleraddress    :string(255)
#  orderdate        :date
#  ordertime        :datetime
#  seller_id        :integer
#  shipping_address :text
#  pptransactionid  :integer
#  params           :text
#  created_at       :datetime
#  updated_at       :datetime
#  listing_id       :integer
#

class Order < ActiveRecord::Base
  
  has_one :trackcode
  has_many :reviews
  serialize :params
end
