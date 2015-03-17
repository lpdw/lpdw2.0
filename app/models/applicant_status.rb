class ApplicantStatus < ActiveRecord::Base
    extend SimpleCalendar
  belongs_to :applicant
  has_calendar :attribute => :interview_date

#Return status of  current apply
  def self.checkfinish
    return self.is_finish
  end
  def self.getapplicant(id)
    return Applicant.find_by(id: id)
  end
end
