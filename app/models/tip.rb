class Tip < ActiveRecord::Base
    self.inheritance_column = :foo
	belongs_to :user
 	validates :title, :description, :type, presence: true
end