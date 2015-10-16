class AddMapToTips < ActiveRecord::Migration
  def change
    add_column :tips, :map, :string
  end
end
