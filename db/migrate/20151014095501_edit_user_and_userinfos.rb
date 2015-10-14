class EditUserAndUserinfos < ActiveRecord::Migration
  def change

    remove_column :users_infos, :facebook
    remove_column :users_infos, :github
    remove_column :users_infos, :googleplus
    remove_column :users_infos, :viadeo

    add_column :users, :facebook, :string, :limit => 255
    add_column :users, :github, :string,  :limit => 255
    add_column :users, :googleplus, :string,  :limit => 255
    add_column :users, :viadeo, :string, :limit => 255
    add_column :applicants, :graduation, :boolean, :default => false

  end
end
