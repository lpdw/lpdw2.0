class RemoveAuthorFromActualities < ActiveRecord::Migration
  def change
    Actuality.all.each do |actuality|
    	user = User.find_by(email: actuality.author)
      actuality.update_attributes(user_id: user.id)
    end

    remove_column :actualities, :author, :string
  end
end
