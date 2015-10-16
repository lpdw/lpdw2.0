namespace :users_info do
  desc "Create users_info association for all users"
  task :create => :environment do
    User.all.each do |user|
      user.create_users_info
    end
  end
end