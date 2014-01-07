# == Schema Information
#
# Table name: profiles
#
#  id            :integer          not null, primary key
#  fullname      :string(255)
#  paypalemail   :string(255)
#  displayname   :string(255)
#  timezone      :string(255)
#  country       :string(255)
#  market        :string(255)
#  location      :string(255)
#  aboutme       :string(255)
#  twitterhandle :string(255)
#  websiteurl    :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  vendor_id     :integer
#

class Profile < ActiveRecord::Base
  has_one :vendor
end
