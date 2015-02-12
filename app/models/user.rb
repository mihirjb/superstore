# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  firstname              :string(255)
#  credits                :integer
#  ref_id                 :integer
#
require 'valid_email'

class User < ActiveRecord::Base


include ActiveModel::Validations
  

  after_create :initialize_credits
  
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable



          acts_as_voter    

          has_many :listings, :dependent =>:destroy
          has_one :profile, dependent: :destroy, autosave: true
          accepts_nested_attributes_for :profile
          
          validates :firstname, presence: true
          validates :email, :email => {:mx => true, :message => I18n.t('validations.errors.models.user.invalid_email')}
          validates :email, :email => {:ban_disposable_email => true, :message => I18n.t('validations.errors.models.user.invalid_email')}
          
          
private
def initialize_credits()
  @newcreds = 100
  self.update_columns(:credits => @newcreds)
end 
          
end
