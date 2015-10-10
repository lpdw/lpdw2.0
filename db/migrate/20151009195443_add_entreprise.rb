class AddEntreprise < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.column :name, :string
      t.column :description, :text, :limit => 4294967295
      t.column :address, :string
      t.column :zip_code, :string
      t.column :city, :string
      t.column :phone_number, :string
      t.column :website, :string
      t.column :twitter, :string
      t.column :linkedin, :string
      t.column :logo_url, :string
      t.column :founded_at, :date
      t.column :posted_by, :integer
      t.timestamps
    end
  end
end
