class Image < ActiveRecord::Base
  has_attached_file :file
  validates_attachment_content_type :file, :content_type => /\Aimage/
  validates_attachment_file_name :file, :matches => [/png\Z/, /jpe?g\Z/]
  # attr_accessible :attachment, :alt, :hint
end