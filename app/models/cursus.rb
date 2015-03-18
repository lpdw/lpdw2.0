class Cursus < ActiveRecord::Base
  belongs_to :applicant, :dependent => :destroy
end
