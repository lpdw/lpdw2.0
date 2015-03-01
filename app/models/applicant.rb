class Applicant < ActiveRecord::Base
  has_many :cursus, :class_name => 'Cursus', :foreign_key => 'id_applicant'
  has_many :other_application, :class_name => 'OtherApplication', :foreign_key => 'id_applicant'
  has_many :professional_experiences, :class_name => 'ProfessionalExperience', :foreign_key => 'id_applicant'
  has_many :project_applicants, :class_name => 'ProjectApplicant', :foreign_key => 'id_applicant'
  has_many :votes, :class_name => 'Vote', :foreign_key => 'id_applicant'
  has_one :applicant_statuses, :class_name => 'ApplicantStatus', :foreign_key => 'id_applicant'

  def self.authenticate(email, assurance)
    applicant = find_by_email(email)
    if applicant && applicant.assurance == assurance
      applicant
    else
      nil
    end
  end

end
