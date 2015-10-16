class Job < ActiveRecord::Base
  belongs_to :company
  accepts_nested_attributes_for :company

	validates :contact, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end

