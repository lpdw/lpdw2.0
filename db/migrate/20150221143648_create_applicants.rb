class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
    	t.column :deposit_date, :datetime
    	t.column :name, :string
    	t.column :first_name, :string
    	t.column :address, :string
    	t.column :zip_code, :integer
    	t.column :city, :string
    	t.column :home_phone, :string
    	t.column :private_phone, :string
    	t.column :email, :string
    	t.column :birth, :datetime
    	t.column :birth_place, :string
    	t.column :nationality, :string
    	t.column :assurance, :string
    	t.column :status, :boolean
    	t.column :has_connection, :boolean
    	t.column :connection_desc, :text
    	t.column :know_formation, :text
    	t.column :english_skill, :integer
    	t.column :other_language, :string
    	t.column :after_school, :text
      t.column :ip_address, :string
      t.timestamps
    end
  end
end
