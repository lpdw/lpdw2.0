class Studentsbook2 < ActiveRecord::Migration
  def change
    add_column :users_infos, :graduation_year, :integer,:limit => 4, :default => 0
  end
end
