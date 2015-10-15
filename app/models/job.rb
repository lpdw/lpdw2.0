class Job < ActiveRecord::Base
  belongs_to :company
  accepts_nested_attributes_for :company
end

