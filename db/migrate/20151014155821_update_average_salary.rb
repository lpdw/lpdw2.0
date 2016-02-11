class UpdateAverageSalary < ActiveRecord::Migration
  def change
    #drop_table :average_salaries
    #remove_column :users_infos, :average_salary_id
    add_column :users_infos, :current_average_salary, :string
    add_column :users_infos, :lp_average_salary, :string
  end
end
