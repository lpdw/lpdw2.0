class ProjectApplicant < ActiveRecord::Base
  belongs_to :applicant, :dependent => :destroy
end
