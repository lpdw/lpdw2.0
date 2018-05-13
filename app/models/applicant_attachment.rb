# == Schema Information
#
# Table name: applicant_attachments
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  id_applicant      :integer
#

class ApplicantAttachment < ActiveRecord::Base

  belongs_to :applicant

  has_attached_file :file, :hash_secret => "yTpjds(zmlp457ez!#r564dsffd", :path => :default_path_by_applicant, :url => :default_url_by_applicant
  validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'application/pdf']

  validates_attachment :file,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png", "application/pdf"] }

  #Change path and url access to upload file
  private
  def default_path_by_applicant
    "public/assets/upload/:class/#{id_applicant}/:hash.:extension"
  end
  def default_url_by_applicant
    "/assets/upload/:class/#{id_applicant}/:hash.:extension"
  end
end
