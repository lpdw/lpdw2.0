# == Schema Information
#
# Table name: tipcategories
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Tipcategory < ActiveRecord::Base
  validates :title, presence: true
end
