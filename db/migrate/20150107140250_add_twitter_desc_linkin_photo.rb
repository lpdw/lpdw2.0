class AddTwitterDescLinkinPhoto < ActiveRecord::Migration
  def change
    add_column :users, :photo, :string
    add_column :users, :twitter, :string
    add_column :users, :description, :string
    add_column :users, :linkin, :string

  end
end
