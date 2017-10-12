# frozen_string_literal: true

class CreateRailwayLines < ActiveRecord::Migration[5.1]
  def change
    create_table :railway_lines, id: :serial, unsigned: true do |t|
      t.integer :company_id, unsigned: true, null: false

      t.integer :railway_type_id, unsigned: true, null: false

      t.text :name, null: false

      t.timestamps null: false
    end
  end
end
