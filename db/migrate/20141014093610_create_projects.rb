class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.auto-generated, :project_id
      t.string :name

      t.timestamps
    end
  end
end
