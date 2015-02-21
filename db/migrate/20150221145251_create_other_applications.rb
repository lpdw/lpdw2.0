class CreateOtherApplications < ActiveRecord::Migration
  def change
    create_table :other_applications do |t|
      t.column :id_applicant, :integer
      t.column :content, :text
      t.timestamps
    end
  end
end
