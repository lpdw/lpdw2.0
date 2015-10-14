class AddFkJob < ActiveRecord::Migration
  def change
    change_table :jobs do |t|
      t.column :company_id, :integer
      add_foreign_key :jobs, :companies
    end
  end
end

