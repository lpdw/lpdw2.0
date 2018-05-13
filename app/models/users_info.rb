# == Schema Information
#
# Table name: users_infos
#
#  id                     :integer          not null, primary key
#  user_id                :integer
#  average_salary         :integer
#  current_job_title      :string(255)
#  current_job_desc       :text(4294967295)
#  lp_job_title           :string(255)
#  lp_job_desc            :text(4294967295)
#  graduation_year        :integer          default(0)
#  current_average_salary :string(255)
#  lp_average_salary      :string(255)
#  cv                     :binary
#

class UsersInfo < ActiveRecord::Base


end
