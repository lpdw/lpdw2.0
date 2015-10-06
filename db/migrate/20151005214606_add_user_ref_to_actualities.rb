class AddUserRefToActualities < ActiveRecord::Migration
  def change
    add_reference :actualities, :user, index: true
  end
end
