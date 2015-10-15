class RenameTypeToCategory < ActiveRecord::Migration
  def change
    rename_column :tips, :type, :category
  end
end
