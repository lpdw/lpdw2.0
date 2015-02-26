class CreateActuality < ActiveRecord::Migration
  def change
    create_table :actualities do |t|
    	t.string :title
      	t.text :content
      	t.string :author
    end
  end
end
