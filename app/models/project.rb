class Project < ActiveRecord::Base
	  has_attached_file :thumbmail, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :thumbmail, :content_type => /\Aimage\/.*\Z/


validates_attachment :thumbmail,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
end
