# == Schema Information
#
# Table name: trackcodes
#
#  id               :integer          not null, primary key
#  code             :string(255)
#  order_id         :integer
#  shipping_company :string(255)
#  shipping_date    :date
#  shipping_city    :string(255)
#  shippingto_city  :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Trackcode < ActiveRecord::Base
  belongs_to :order
  
end
