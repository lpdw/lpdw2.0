class AddNewFieldstepPositionToapplicant < ActiveRecord::Migration
  def change
    add_column :applicants, :step_position, :integer
  end
end
