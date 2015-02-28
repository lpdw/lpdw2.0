class CreateProfessionalExperiences < ActiveRecord::Migration
  def change
    create_table :professional_experiences do |t|
      t.column :id_applicant, :integer
      t.column :year, :integer
      t.column :company, :string
      t.column :role, :string
      t.column :skill, :text
      t.timestamps
    end
  end
end
