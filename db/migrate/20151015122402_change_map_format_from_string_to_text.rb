class ChangeMapFormatFromStringToText < ActiveRecord::Migration
  def change
    change_column :tips, :map, :text
  end
end
