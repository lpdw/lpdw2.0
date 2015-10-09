class AddOffre < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.column :id_job, :integer
      t.column :job_name, :string
      t.column :job_number, :string
      t.column :job_description, :text, :limit => 4294967295
      t.column :start_at, :string
      t.column :duration, :string
      t.column :profil, :text, :limit => 4294967295
      t.column :contact, :string
      t.column :location, :string
      t.column :skills, :text, :limit => 4294967295 
      t.column :status, :integer
      t.column :founded_at, :date
      t.column :posted_by, :integer
      t.timestamps
    end
  end
end

