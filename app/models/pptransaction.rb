# == Schema Information
#
# Table name: pptransactions
#
#  id             :integer          not null, primary key
#  params         :string(255)
#  order_id       :integer
#  transaction_id :integer
#  status         :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

class Pptransaction < ActiveRecord::Base
  serialize :params
  belongs_to :order
end
