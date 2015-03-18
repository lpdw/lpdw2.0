class OtherApplication < ActiveRecord::Base
  belongs_to :applicant

  validates_presence_of :content
end
