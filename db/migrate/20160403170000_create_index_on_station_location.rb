class CreateIndexOnStationLocation < ActiveRecord::Migration
  def change
    add_index :stations, :location, using: :gist
  end
end
