class AddRemoveAttachment < ActiveRecord::Migration
  def self.down
    remove_attachment :applicant_attachments, :file
  end
end
