# == Schema Information
#
# Table name: professional_experiences
#
#  id           :integer          not null, primary key
#  id_applicant :integer
#  year         :integer
#  company      :string(255)
#  role         :string(255)
#  skill        :text
#  created_at   :datetime
#  updated_at   :datetime
#

class ProfessionalExperience < ActiveRecord::Base
  belongs_to :applicant
end
