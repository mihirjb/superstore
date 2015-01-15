# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  fullname            :string(255)
#  paypalemail         :string(255)
#  displayname         :string(255)
#  timezone            :string(255)
#  country             :string(255)
#  market              :string(255)
#  location            :string(255)
#  aboutme             :string(255)
#  twitterhandle       :string(255)
#  websiteurl          :string(255)
#  address             :string(255)
#  phone               :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  user_id             :integer
#

class Profile < ActiveRecord::Base
  validates_presence_of :country


   acts_as_voteable





   belongs_to :user
   has_many :reviews, :dependent => :destroy

   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "30x30>" }, :default_url => "/images/profiles/avatars/:style/missing.png"

   validates_attachment_content_type :avatar, :content_type => %w(image/jpeg image/jpg image/png)

  
end
