class ApplicantStatus < ActiveRecord::Base
    extend SimpleCalendar
  has_one :applicant, class_name: 'Applicant', primary_key: 'id_applicant', foreign_key: 'id'
  has_calendar :attribute => :interview_date

#Return current applicant
  def self.getapplicant(id)
    return Applicant.find_by(id: id)
  end

  def finish!
  	update_attributes(is_finish: true, is_complete: true)
  end
end
