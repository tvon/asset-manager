namespace :db do
  desc "create default admin user"
  task :create_admin => :environment do
    admin = User.create(
      :login => "admin", 
      :name => "Admin", 
      :email => "email @ address . com", 
      :password => "admin", 
      :password_confirmation => "admin"
      )
    admin.activated_at = 5.days.ago
    admin.activation_code = nil
    admin.save false
  end  
end
