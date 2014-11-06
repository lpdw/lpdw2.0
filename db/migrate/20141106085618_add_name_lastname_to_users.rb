class AddNameLastnameToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :lastname, :string
  	add_column :users, :name, :string
  end
end
