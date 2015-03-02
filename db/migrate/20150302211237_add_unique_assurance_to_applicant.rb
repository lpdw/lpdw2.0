class AddUniqueAssuranceToApplicant < ActiveRecord::Migration
  def change
    add_index :applicants, :assurance, :unique => true
  end
end
