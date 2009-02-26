require 'yaml'

namespace :db do
  
  desc "Load some sample users into the database"
  task :sample => :environment do |t|
    @workingdirectory = File.expand_path(File.dirname(__FILE__))
    configfile = "#{RAILS_ROOT}/config/sample_data.yml"
    
    @data = YAML.load_file(configfile)
    
    @data.each do |key, value|
      puts "Creating user '#{key['login']}:#{key['password']}'"
      user = User.create(key)
      user.state = 'active'
      user.save
    end
  
  end

end