require 'rake'
require File.expand_path('../config/environment', __FILE__)
require 'active_support/core_ext'
# require_relative 'lib/fps_seeder'

namespace :db do
  task reset: [:drop, :create, :migrate]

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
      FPS_MODIFIER = 100
      path = File.expand_path("#{ENV['path']}")
      puts "Seeding JSON files in directory - #{path}"

      Dir["#{path}/*.json"].each do |json_file|
        puts "  ** seeding #{json_file}"
        json_doc = JSON.parse(IO.read(json_file))
        log_data = json_doc['collections'].first

        log = Log.create!({
          datetime:   log_data['datetime'],
          seed:       log_data['seed'],
          act:        log_data['act'],
          world:      log_data['world'],
          scene:      log_data['scene'],
          quest:      log_data['quest'],
          quest_step: log_data['quest_step'],
          location:   log_data['loc7ation'],
          klass:      log_data['class']
        })

        log_data['samples'].each do |sample|
          log.samples.create!({
            datetime:                   sample['datetime'],
            fps:                        sample['fps'] * FPS_MODIFIER,
            batches:                    sample['batches'],
            tris:                       sample['tris'],
            num_particle_systems:       sample['num_particle_systems'],
            num_particles:              sample['num_particles'],
            domino_step_ms:             sample['domino_step_ms'],
            num_static_rigid_bodies:    sample['num_static_rigid_bodies'],
            num_kinematic_rigid_bodies: sample['num_kinematic_rigid_bodies'],
            num_dynamic_rigid_bodies:   sample['num_dynamic_rigid_bodies'],
            num_awake_bodies:           sample['num_awake_bodies'],
            main_thread_bound:          sample['Main Thread bound'],
            gpu_bound:                  sample['GPU bound']
          })
        end
      end
    else
      puts "Please enter directory path - 'rake fps:seed_from_path path='example/dir'"
    end
  end

  task :generate_fps_averages do
    Log.generate_average_fps
  end
end

task :console do
  exec("irb -r ./config/environment")
end
