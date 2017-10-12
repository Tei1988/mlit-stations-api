# frozen_string_literal: true

class EnablePostgisExtension < ActiveRecord::Migration[5.1]
  def change
    execute 'CREATE EXTENSION IF NOT EXISTS postgis;'
    execute 'CREATE EXTENSION IF NOT EXISTS postgis_topology;'
  end
end
