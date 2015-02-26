class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.column :id_applicant, :integer
      t.column :id_voter, :integer
      t.column :value, :integer
      t.timestamps
    end
  end
end
