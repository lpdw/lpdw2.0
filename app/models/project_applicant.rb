# == Schema Information
#
# Table name: project_applicants
#
#  id           :integer          not null, primary key
#  id_applicant :integer
#  project_type :string(255)
#  year         :integer
#  content      :text
#  created_at   :datetime
#  updated_at   :datetime
#

class ProjectApplicant < ActiveRecord::Base
  belongs_to :applicant
end
