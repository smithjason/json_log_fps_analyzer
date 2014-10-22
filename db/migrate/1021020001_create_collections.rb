class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.datetime    :datetime
      t.integer     :seed
      t.string      :act
      t.string      :world
      t.string      :scene
      t.string      :quest
      t.integer     :quest_step
      # TODO
      # => Figure out how to get hstore to work
      # t.hstore      'location'
      t.string      :class

      t.timestamps
    end
  end
end
