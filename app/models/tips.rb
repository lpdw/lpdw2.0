class Tips < ActiveRecord::Base
	belongs_to :user
 	validates :title, :decription, :type, presence: true
end