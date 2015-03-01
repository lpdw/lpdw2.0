class CreateProjectApplicants < ActiveRecord::Migration
  def change
    create_table :project_applicants do |t|
      t.column :id_applicant, :integer
      t.column :project_type, :string
      t.column :year, :integer
      t.column :content, :text

      t.timestamps
    end
  end
end
