# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  vendor_id     :integer
#  devicename    :string(255)
#  devicecarrier :string(255)
#  deviceimei    :string(255)
#  ordertotal    :string(255)
#  selleraddress :string(255)
#  orderdate     :date
#  ordertime     :datetime
#  created_at    :datetime
#  updated_at    :datetime
#

class Order < ActiveRecord::Base
end
