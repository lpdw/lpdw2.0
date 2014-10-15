class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :name
      t.string :level
      t.bool :active

      t.timestamps
    end
  end
end
