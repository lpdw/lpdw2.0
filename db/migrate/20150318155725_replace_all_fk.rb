class ReplaceAllFk < ActiveRecord::Migration
  def change
    remove_foreign_key :applicant_statuses, {:column => 'id_applicant'}
    remove_foreign_key :project_applicants, {:column => 'id_applicant'}
    remove_foreign_key :votes, {:column => 'id_applicant'}
    remove_foreign_key :cursus, {:column => 'id_applicant'}
    remove_foreign_key :other_applications, {:column => 'id_applicant'}
    remove_foreign_key :professional_experiences, {:column => 'id_applicant'}
    remove_foreign_key :applicant_attachments, {:column => 'id_applicant'}

    add_foreign_key :applicant_statuses, :applicants, :column => 'id_applicant', dependent: :delete
    add_foreign_key :project_applicants, :applicants, :column => 'id_applicant', dependent: :delete
    add_foreign_key :votes, :applicants, :column => 'id_applicant', dependent: :delete
    add_foreign_key :cursus, :applicants, :column => 'id_applicant', dependent: :delete
    add_foreign_key :other_applications, :applicants, :column => 'id_applicant', dependent: :delete
    add_foreign_key :professional_experiences, :applicants, :column => 'id_applicant', dependent: :delete
    add_foreign_key :applicant_attachments, :applicants, :column => 'id_applicant', dependent: :delete
  end
end
