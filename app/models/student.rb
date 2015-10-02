class Student < ActiveRecord::Base
  self.table_name = "users_infos"
  belongs_to :user
end