class ApplicantStatus < ActiveRecord::Base
  belongs_to :applicant

#Return status of  current apply
  def self.checkfinish
    return self.is_finish
  end
end
