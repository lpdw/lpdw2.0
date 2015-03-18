class OtherApplication < ActiveRecord::Base
  belongs_to :applicant, :dependent => :destroy

  validates_presence_of :content
end
