class CreateActuality < ActiveRecord::Migration
  def change
    create_table :actualities do |t|
    	t.string :title,              null: false, default: ""
      	t.string :content, null: false, default: ""
      	t.string :author, null: false, default: ""
    end
  end
end
