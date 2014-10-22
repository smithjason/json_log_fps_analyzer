class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.datetime  :datetime
      t.decimal   :fps
      t.integer   :batches, array: true
      t.integer   :tris, array: true
      t.integer   :num_particle_systems
      t.integer   :num_particles
      t.decimal   :domino_step_ms
      t.integer   :num_static_rigid_bodies
      t.integer   :num_kinematic_rigid_bodies
      t.integer   :num_dynamic_rigid_bodies
      t.integer   :num_awake_bodies
      t.boolean   :main_thread_bound
      t.boolean   :gpu_bound

      t.timestamps
    end
  end
end
