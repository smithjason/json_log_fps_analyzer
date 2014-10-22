class Sample
  attr_reader :collection_id,
              :datetime,
              :fps,
              :batches,
              :tris,
              :num_particle_systems,
              :num_particles,
              :domino_steps_ms,
              :num_static_bodies,
              :num_kinematic_rigid_bodies,
              :num_dynamic_rigid_bodies,
              :num_awake_bodies,
              :main_thread_bound,
              :gpu_bound

  def initialize(args)
    @collection_id              = args[:collection_id]
    @datetime                   = args[:datetime]
    @fps                        = args[:fps]
    @batches                    = args[:batches]
    @tris                       = args[:batches]
    @num_particle_systems       = args[:num_particle_systems]
    @num_particles              = args[:num_particles]
    @domino_steps_ms            = args[:domino_steps_ms]
    @num_static_bodies          = args[:num_static_bodies]
    @num_kinematic_rigid_bodies = args[:num_kinematic_rigid_bodies]
    @num_dynamic_rigid_bodies   = args[:num_dynamic_rigid_bodies]
    @num_awake_bodies           = args[:num_awake_bodies]
    @main_thread_bound          = args[:main_thread_bound]
    @gpu_bound                  = args[:gpu_bound]
  end
end
