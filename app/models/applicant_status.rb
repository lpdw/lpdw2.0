class ApplicantStatus < ActiveRecord::Base
    extend SimpleCalendar
  belongs_to :applicant
  has_calendar :attribute => :interview_date

#Return current applicant
  def self.getapplicant(id)
    return Applicant.find_by(id: id)
  end
end
