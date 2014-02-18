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
  
  belongs_to :listing, touch: true
  
  validates :commentbody, :presence => {:message => 'Heading cannot be blank, Listing not saved'}
  validates :commentbody, :length => {:maximum => 140}
  
  
  
 private
 def self.get_comment_count(listing_id)
 @count = Comment.where("status like ? AND listing_id = ?", "Approved", listing_id).count
 end
 
 def self.get_comment_author(comments_vendorid)
   @author = Profile.find_by_vendor_id(comments_vendorid).displayname
   @vendor =  Vendor.find(comments_vendorid)
   @newauthor  = Account.find(@vendor.account_id).subdomain
   
   if @author
		@author
	else 
		@newauthor
	end

  end

  private

  def deny_to_visitors
    redirect_to root_path unless user_signed_in? or admin_signed_in?
  end
  

  
end
