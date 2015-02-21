class CreateApplicantStatuses < ActiveRecord::Migration
  def change
    create_table :applicant_statuses do |t|
      t.column :id_applicant, :integer
      t.column :is_finish, :boolean
      t.column :is_complete, :integer
      t.column :ok_for_interview, :boolean
      t.column :interview_result, :integer
      t.column :interview_date, :datetime
      t.column :applicant_response, :integer
      t.column :is_refused, :boolean

      t.timestamps
    end
  end
end
