class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations, id: :serial, unsigned: true do |t|
      t.integer :railway_line_id, unsigned: true, null: false

      t.text :name, null: false
      t.st_point :location, geographic: true, srid: 6668

      t.text :original_signature, null: false

      t.timestamps null: false
    end
  end
end
