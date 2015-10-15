class AddEmailToTips < ActiveRecord::Migration
  def change
    add_column :tips, :email, :string
  end
end
