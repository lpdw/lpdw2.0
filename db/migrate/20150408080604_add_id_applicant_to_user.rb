class AddIdApplicantToUser < ActiveRecord::Migration
  def change
    add_column :users, :id_applicant, :integer
    add_foreign_key :users, :applicants, :column => 'id_applicant', dependent: :delete
  end
end
