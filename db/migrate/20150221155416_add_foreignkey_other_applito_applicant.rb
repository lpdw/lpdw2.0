class AddForeignkeyOtherApplitoApplicant < ActiveRecord::Migration
  def change
    add_foreign_key :applicant_statuses, :applicants, :column => 'id_applicant', dependent: :delete
  end
end
