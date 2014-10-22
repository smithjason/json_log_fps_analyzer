require 'rake'
require ::File.expand_path('../config/environment',__FILE__)
require 'active_support/core_ext'
# require_relative 'lib/fps_seeder'

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
    ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
      ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
    end
  end
end

namespace :fps do
  task :seed_from_path do
    if ENV['path']
      path = File.expand_path("#{ENV['path']}")
      puts "Seeding JSON files in directory - #{path}"

      Dir["#{path}/*.json"].each do |json_file|
        puts "  ** seeding #{json_file}"
        json_doc = JSON.parse(IO.read(json_file))
        log_data = json_doc['collections'].first

        log = Log.create(
          :datetime     => log_data['datetime'],
          :seed         => log_data['seed'],
          :act          => log_data['act'],
          :world        => log_data['world'],
          :scene        => log_data['scene'],
          :quest        => log_data['quest'],
          :quest_step   => log_data['quest_step'],
          # :location     => log_data['location'],
          :klass        => log_data['class']
        )

        log_data['samples'].each do |sample_data|
          log.samples.create(
            :datetime                   => sample_data['datetime'],
            :fps                        => sample_data['fps'],
            :batches                    => sample_data['batches'],
            :tris                       => sample_data['tris'],
            :num_particle_systems       => sample_data['num_particle_systems'],
            :num_particles              => sample_data['num_particles'],
            :domino_step_ms             => sample_data['domino_step_ms'],
            :num_static_rigid_bodies    => sample_data['num_static_rigid_bodies'],
            :num_kinematic_rigid_bodies => sample_data['num_kinematic_rigid_bodies'],
            :num_dynamic_rigid_bodies   => sample_data['num_dynamic_rigid_bodies'],
            :num_awake_bodies           => sample_data['num_awake_bodies'],
            :main_thread_bound          => sample_data['Main Thread bound'],
            :gpu_bound                  => sample_data['GPU bound']
          )
        end
      end
    else
      puts "Please enter directory path - 'rake fps:seed_from_path path='example/dir'"
    end
  end

  # TODO
  # => Implement when you've gotten everything working with fps:add_path
  task :seed_paths do

  end
end

task :console do
  exec("irb -r./config/environment")
end
