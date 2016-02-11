class EditCollumnUsersInfos < ActiveRecord::Migration
  def change

    remove_column :users, :viadeo
    remove_column :users_infos, :cv
    add_column :users_infos, :cv, :binary
  end
end
