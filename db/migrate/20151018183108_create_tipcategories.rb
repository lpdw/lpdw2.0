class CreateTipcategories < ActiveRecord::Migration
  def change
    create_table :tipcategories do |t|
      t.string :title
      t.timestamps
    end
  end
end
