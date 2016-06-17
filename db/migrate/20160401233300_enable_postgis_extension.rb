class EnablePostgisExtension < ActiveRecord::Migration
  def change
    execute 'CREATE EXTENSION IF NOT EXISTS postgis;'
    execute 'CREATE EXTENSION IF NOT EXISTS postgis_topology;'
  end
end
