class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :title
      t.text :description
      t.text :address
      t.string :url
      t.string :phone
      t.date :created_at
      t.date :updated_at
      t.date :end_at
      t.string :status
      t.string :category

      t.timestamps
    end
  end
end
