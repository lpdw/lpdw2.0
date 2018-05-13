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

class Alert < ActiveRecord::Base
	 LEVELS = %w[alert-blue alert-green alert-purple alert-orange]
end
