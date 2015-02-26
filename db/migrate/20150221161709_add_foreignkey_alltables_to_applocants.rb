class AddForeignkeyAlltablesToApplocants < ActiveRecord::Migration
  def change
    add_foreign_key :project_applicants, :applicants, :column => 'id_applicant'
    add_foreign_key :votes, :applicants, :column => 'id_applicant'
    add_foreign_key :cursus, :applicants, :column => 'id_applicant'
    add_foreign_key :other_applications, :applicants, :column => 'id_applicant'
    add_foreign_key :professional_experiences, :applicants, :column => 'id_applicant'
  end
end
