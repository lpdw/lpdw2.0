# == Schema Information
#
# Table name: average_salaries
#
#  id    :integer          not null, primary key
#  value :string(255)
#

class AverageSalary < ActiveRecord::Base
  has_many :students
end
