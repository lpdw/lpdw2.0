# == Schema Information
#
# Table name: alerts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  content    :text
#  level      :string(255)
#  active     :boolean
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class AlertTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
