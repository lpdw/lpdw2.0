class Companies < ActiveRecord::Base
  has_many :jobs
  has_many :users
end

