# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  subdomain  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Account < ActiveRecord::Base
  has_one :owner, :class_name => "Vendor"

   has_many :vendors

   RESTRICTED_SUBDOMAINS = %w["www" "api" "help" "info" "admin" "support" "faq" "home" "about" "contact"]
   validates_presence_of :subdomain
   validates_uniqueness_of :subdomain, case_sensitive: false
   validates_format_of :subdomain, with: /\A[\w\-]+\Z/i, message: 'contains invalid characters'
   validates_exclusion_of :subdomain, in: RESTRICTED_SUBDOMAINS, message: 'restricted' 


   accepts_nested_attributes_for :owner
end
