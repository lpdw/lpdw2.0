# == Schema Information
#
# Table name: jobs
#
#  id              :integer          not null, primary key
#  job_name        :string(255)
#  job_number      :string(255)
#  job_description :text(4294967295)
#  start_at        :string(255)
#  duration        :string(255)
#  profil          :text(4294967295)
#  contact         :string(255)
#  location        :string(255)
#  skills          :text(4294967295)
#  status          :integer
#  founded_at      :date
#  posted_by       :integer
#  created_at      :datetime
#  updated_at      :datetime
#  company_id      :integer
#

class Job < ActiveRecord::Base
  belongs_to :company
  accepts_nested_attributes_for :company

	validates :contact, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end

