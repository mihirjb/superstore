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
#  status      :string(255)
#

class Comment < ActiveRecord::Base
  
  
  
  
 private
 def self.get_comment_count(listing_id)
 @count = Comment.find_all_by_listing_id(listing_id).count
 end
 
 def self.get_comment_author(comments_vendorid)
    @author = Profile.find_by_vendor_id(comments_vendorid).displayname
  end
  

  
end
