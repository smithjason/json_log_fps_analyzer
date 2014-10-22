class SetupHstore < ActiveRecord::Migration
  def up
    execute "CREATE SCHEMA hstore"
    execute 'CREATE EXTENSION IF NOT EXISTS hstore SCHEMA hstore'
  end

  def down
    execute 'DROP EXTENSION IF EXISTS hstore'
    execute 'DROP SCHEMA IF EXISTS hstore'
  end
end
