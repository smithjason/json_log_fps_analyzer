class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|

      t.hstore      'location'
    end
  end
end
