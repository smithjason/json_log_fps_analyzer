require 'rake'
require ::File.expand_path('../config/environment',__FILE__)
require 'active_support/core_ext'

namespace :db do
  task :reset => [:drop, :create, :migrate]

  task :create do
    puts "Creating development database"
    system("createdb #{APP_NAME}_development")
  end

  task :drop do
    puts "Dropping development database"
    system("dropdb #{APP_NAME}_development")
  end

  task :migrate do
    ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrations'
    # TODO
    # => Once things are working, check that you can remove these options
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths) do |migration|
      ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
    end
  end
end

namespace :fps do
  task :add_path do

  end

  # TODO
  # => Implement when you've gotten everything working with fps:add_path
  task :add_paths do

  end

  task :seed do

  end
end

task :console do
  system("pry -r ./config/environment")
end
