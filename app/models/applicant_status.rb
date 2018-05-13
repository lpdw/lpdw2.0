# == Schema Information
#
# Table name: applicant_statuses
#
#  id                 :integer          not null, primary key
#  id_applicant       :integer
#  is_finish          :boolean
#  is_complete        :integer
#  ok_for_interview   :boolean
#  interview_result   :integer
#  interview_date     :datetime
#  applicant_response :integer
#  is_refused         :boolean
#  created_at         :datetime
#  updated_at         :datetime
#

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
