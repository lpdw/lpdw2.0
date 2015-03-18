class ProfessionalExperience < ActiveRecord::Base
  belongs_to :applicant, :dependent => :destroy
end
