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

class Vote < ActiveRecord::Base
  belongs_to :applicant, :dependent => :destroy
end
