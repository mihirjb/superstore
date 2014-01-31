# == Schema Information
#
# Table name: specifications
#
#  id           :integer          not null, primary key
#  manufacturer :string(255)
#  providers    :string(255)
#  speed        :string(255)
#  ram          :string(255)
#  storage      :string(255)
#  microsd      :string(255)
#  resolution   :string(255)
#  displaysize  :string(255)
#  features     :string(255)
#  size         :string(255)
#  weight       :string(255)
#  formfactor   :string(255)
#  colors       :string(255)
#  megapixels   :string(255)
#  camfeatures  :string(255)
#  phonetype    :string(255)
#  cariiers     :string(255)
#  networks     :string(255)
#  releasedate  :string(255)
#  wifi         :string(255)
#  bluetooth    :string(255)
#  gps          :string(255)
#  fourg        :string(255)
#  microusb     :string(255)
#  audiojack    :string(255)
#  radio        :string(255)
#  speakerphone :string(255)
#  lion         :string(255)
#  replace      :string(255)
#  batreplace   :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  phone_id     :integer
#

class Specification < ActiveRecord::Base
  belongs_to :phone
end
