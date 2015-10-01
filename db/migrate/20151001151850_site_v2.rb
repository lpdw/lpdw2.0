class SiteV2 < ActiveRecord::Migration
  def change
    create_table :users_infos do |t|
      t.integer :user_id
      t.string  :github, :limit => 255
      t.integer :average_salary
      t.string  :current_job_title, :limit => 255
      t.text  :current_job_desc, :limit => 4294967295
      t.string  :lp_job_title, :limit => 255
      t.text  :lp_job_desc, :limit => 4294967295
      t.string  :cv, :limit => 255
      t.string  :googleplus, :limit => 255
      t.string  :facebook, :limit => 255
      t.string  :viadeo, :limit => 255
    end

    create_table :average_salary do |t|
      t.string  :value, :limit => 255
    end

    add_index :average_salary, :id, :unique => true
    add_index :users_infos, :id, :unique => true

    add_foreign_key :users_infos, :users, :column => 'user_id', dependent: :delete
    add_foreign_key :users_infos, :average_salary, :column => 'average_salary', dependent: :delete

  end
end
