# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  subject     :string(255)
#  commentbody :text
#  vendor_id   :integer
#  listing_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Comment < ActiveRecord::Base
end
