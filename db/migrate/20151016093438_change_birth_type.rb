class ChangeBirthType < ActiveRecord::Migration
  def change
    change_column :users, :birth, :date
  end
end
