# == Schema Information
#
# Table name: actualities
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  user_id    :integer
#

class Actuality < ActiveRecord::Base
  belongs_to :user
  validates :title, :content, presence: true
end
