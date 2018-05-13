# == Schema Information
#
# Table name: projects
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  description            :text
#  link                   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  thumbmail_file_name    :string(255)
#  thumbmail_content_type :string(255)
#  thumbmail_file_size    :integer
#  thumbmail_updated_at   :datetime
#

class Project < ActiveRecord::Base
	  has_attached_file :thumbmail, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :thumbmail, :content_type => /\Aimage\/.*\Z/


validates_attachment :thumbmail,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
end
