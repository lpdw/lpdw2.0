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

require 'test_helper'

class ApplicantStatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
