class Company < ActiveRecord::Base
  has_many :jobs, :dependent => :nullify
  has_many :users
end

