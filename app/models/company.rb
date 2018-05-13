# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :text(4294967295)
#  address      :string(255)
#  zip_code     :string(255)
#  city         :string(255)
#  phone_number :string(255)
#  website      :string(255)
#  twitter      :string(255)
#  linkedin     :string(255)
#  logo_url     :string(255)
#  founded_at   :date
#  posted_by    :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Company < ActiveRecord::Base
  has_many :jobs, :dependent => :nullify
  has_many :users
end

