class AddCreateAtActuality < ActiveRecord::Migration
  def change
  	  	add_column :actualities, :created_at, :datetime
  end
end
