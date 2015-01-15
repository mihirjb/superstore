# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  author_id  :integer
#  reviewbody :text
#  thumbsup   :boolean
#  profile_id :integer
#  order_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Review < ActiveRecord::Base
  belongs_to :profile
  belongs_to :order
  
  
  validates :reviewbody, :presence => {:message => 'Heading cannot be blank, Listing not saved'}
  validates :reviewbody, :length => {:maximum => 140}
  
  
end
