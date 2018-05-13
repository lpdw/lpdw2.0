# == Schema Information
#
# Table name: other_applications
#
#  id           :integer          not null, primary key
#  id_applicant :integer
#  content      :text
#  created_at   :datetime
#  updated_at   :datetime
#

class OtherApplication < ActiveRecord::Base
  belongs_to :applicant

  validates_presence_of :content
end
