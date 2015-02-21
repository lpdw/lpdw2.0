class CreateCursus < ActiveRecord::Migration
  def change
    create_table :cursus do |t|
      t.column :id_applicant, :integer
      t.column :graduation, :string
      t.column :year, :integer
      t.column :option, :string
      t.column :result, :string
      t.column :place, :string

      t.timestamps
    end
  end
end
