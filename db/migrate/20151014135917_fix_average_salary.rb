class FixAverageSalary < ActiveRecord::Migration
  def change
    rename_column :users_infos, :average_salary, :average_salary_id
    rename_table :average_salary, :average_salaries
  end
end
