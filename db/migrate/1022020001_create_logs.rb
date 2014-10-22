class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.datetime    :datetime
      t.integer     :seed
      t.string      :act
      t.string      :world
      t.string      :scene
      t.string      :quest
      t.integer     :quest_step
      t.string      :klass

      t.timestamps
    end
  end
end
