class Company < ActiveRecord::Base
  has_many :jobs, :dependent => :delete_all
  has_many :users
end

