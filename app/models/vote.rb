class Vote < ActiveRecord::Base
  belongs_to :applicant, :dependent => :destroy
end
