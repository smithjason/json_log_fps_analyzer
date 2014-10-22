require 'json'
require_relative 'collection.rb'
require_relative 'sample.rb'

class FPSSeeder
  attr_reader :collections

  def initialize
    @collections = []
  end

  def seed_path(dir_path)
    Dir["#{dir_path}/*.json"].each do |json_file|
      json_doc = JSON.parse(IO.read(json_file))
      collection_data = json_doc['collections'].first

      samples = collection_data['samples'].map do |sample_data|
        Sample.new(
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

      @collections << Collection.new(
        :datetime     => collection_data['datetime'],
        :seed         => collection_data['seed'],
        :act          => collection_data['act'],
        :world        => collection_data['world'],
        :scene        => collection_data['scene'],
        :quest        => collection_data['quest'],
        :quest_step   => collection_data['quest_step'],
        :location     => collection_data['location'],
        :class        => collection_data['class'],
        :samples      => samples
      )
    end

    puts "Num Files: #{@collections.count}"

    @collections.each do |collection|
      print "#{collection.act} - #{collection.world}: "
      print "#{collection.samples.count} samples\n"
    end
  end
end
