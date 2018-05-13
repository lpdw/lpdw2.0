# == Schema Information
#
# Table name: cursus
#
#  id           :integer          not null, primary key
#  id_applicant :integer
#  graduation   :string(255)
#  year         :integer
#  option       :string(255)
#  result       :string(255)
#  place        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Cursus < ActiveRecord::Base
  belongs_to :applicant
end
