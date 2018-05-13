# == Schema Information
#
# Table name: applicants
#
#  id              :integer          not null, primary key
#  deposit_date    :datetime
#  name            :string(255)
#  first_name      :string(255)
#  address         :string(255)
#  zip_code        :integer
#  city            :string(255)
#  home_phone      :string(255)
#  private_phone   :string(255)
#  email           :string(255)
#  birth           :datetime
#  birth_place     :string(255)
#  nationality     :string(255)
#  assurance       :string(255)
#  status          :boolean
#  has_connection  :boolean
#  connection_desc :text
#  know_formation  :text
#  english_skill   :integer
#  other_language  :string(255)
#  after_school    :text
#  ip_address      :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  step_position   :integer
#  graduation      :boolean          default(FALSE)
#

require 'test_helper'

class ApplicantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
