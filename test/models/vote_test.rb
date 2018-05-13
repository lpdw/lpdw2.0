# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  id_applicant :integer
#  id_voter     :integer
#  value        :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
