# frozen_string_literal: true

class CreateIndexOnStationLocation < ActiveRecord::Migration[5.1]
  def change
    add_index :stations, :location, using: :gist
  end
end
