class AddThumbToProject2 < ActiveRecord::Migration
  def change
    add_attachment :projects, :thumbmail
  end
end
