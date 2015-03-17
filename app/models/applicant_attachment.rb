class ApplicantAttachment < ActiveRecord::Base

  belongs_to :applicant

  has_attached_file :file, :path => :default_path_by_applicant, :url => :default_url_by_applicant
  validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'application/pdf']

  validates_attachment :file,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png", "application/pdf"] }
  #Change path and url access to upload file
  private
  def default_path_by_applicant
    "public/assets/upload/:class/#{id_applicant}/:filename"
  end
  def default_url_by_applicant
    "/assets/upload/:class/#{id_applicant}/:filename"
  end
end
