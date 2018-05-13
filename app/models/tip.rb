# == Schema Information
#
# Table name: tips
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  address     :text
#  url         :string(255)
#  phone       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  end_at      :date
#  status      :string(255)
#  category    :string(255)
#  email       :string(255)
#  map         :text(255)
#

class Tip < ActiveRecord::Base
	belongs_to :user
	belongs_to :tipcategory

 	validates :title, :description, :category, presence: true
end

