class CreateApplicantAttachments < ActiveRecord::Migration
  def change
    create_table :applicant_attachments do |t|
      t.string :name
      t.attachment :file
      t.integer :id_applicant
    end
    add_foreign_key :applicant_attachments, :applicants, :column => 'id_applicant'
  end
end
