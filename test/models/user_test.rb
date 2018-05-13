# == Schema Information
#
# Table name: users
#
#  id                           :integer          not null, primary key
#  email                        :string(255)      default(""), not null
#  encrypted_password           :string(255)      default(""), not null
#  reset_password_token         :string(255)
#  reset_password_sent_at       :datetime
#  remember_created_at          :datetime
#  sign_in_count                :integer          default(0), not null
#  current_sign_in_at           :datetime
#  last_sign_in_at              :datetime
#  current_sign_in_ip           :string(255)
#  last_sign_in_ip              :string(255)
#  created_at                   :datetime
#  updated_at                   :datetime
#  role                         :string(255)
#  lastname                     :string(255)
#  name                         :string(255)
#  photo                        :string(255)
#  twitter                      :string(255)
#  description                  :string(255)
#  linkin                       :string(255)
#  id_applicant                 :integer
#  facebook                     :string(255)
#  github                       :string(255)
#  googleplus                   :string(255)
#  birth                        :date
#  password_reset_token         :string(255)
#  password_reset_sent_at       :datetime
#  profile_picture_file_name    :string(255)
#  profile_picture_content_type :string(255)
#  profile_picture_file_size    :integer
#  profile_picture_updated_at   :datetime
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
