# == Schema Information
#
# Table name: trackcodes
#
#  id               :integer          not null, primary key
#  code             :string(255)
#  order_id         :integer
#  created_at       :datetime
#  updated_at       :datetime
#  shipping_company :string(255)
#

class Trackcode < ActiveRecord::Base
  
  belongs_to :order
end
