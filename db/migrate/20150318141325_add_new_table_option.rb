class AddNewTableOption < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :key
      t.string :value
    end
  end
end
