# This file should contain all the record creation needed to seed the database with its default values.
# The datahen be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:email => 'admin@mail.com', :password => 'azerty123', :password_confirmation => 'azerty123', :role =>'admin')
@rd1 = Applicant.create!(:name => 'Random_etud', :first_name => 'Random_etud_name', :address => "22 Random address Etud", :zip_code => 78400, :city => "Chatou", :home_phone => "01234567890", :private_phone => "061234567890", :email => "random_etudmail@mail.com", :birth => "04/09/1992", :birth_place => "Paris", :nationality => "France", :assurance => "01234567890123456789", :status => false, :has_connection => false, :connection_desc => "", :know_formation => "internet", :english_skill => 4, :other_language => "Espagnol, random", :after_school => "Random activities")
@rd2 = Applicant.create!(:name => 'Random_etud2', :first_name => 'Random_etud_name2', :address => "11 Random address Etud", :zip_code => 75000, :city => "Paris", :home_phone => "01234567890", :private_phone => "061234567890", :email => "random_etudmail2@mail.com", :birth => "06/11/1990", :birth_place => "Marseille", :nationality => "Hongroise", :assurance => "01234567789423456789", :status => false, :has_connection => false, :connection_desc => "", :know_formation => "internet", :english_skill => 4, :other_language => "Hongrois, random", :after_school => "Random activities lolilol")
@rd1.create_applicant_status(:is_finish => 0, :is_complete => 0, :ok_for_interview => 0, :interview_result => 0, :applicant_response => 0, :is_refused => 0)
@rd2.create_applicant_status(:is_finish => 1, :is_complete => 1, :ok_for_interview => 0, :interview_result => 0, :applicant_response => 0, :is_refused => 0)
Project.create!(:name => 'test Project', :description => "Ceci est un test de description pour voir si tout fonctionne bien pour afficher des projets sur la page rpojet.", :link => "http://google.fr", :thumbmail_file_name => "Mexican_troll_face_by_mariodude12312-d5mtl9z.png.png", :thumbmail_content_type => 'image/png')