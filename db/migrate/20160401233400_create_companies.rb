# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies, id: :serial, unsigned: true do |t|
      t.integer :service_provider_type_id, unsigned: true, null: false

      t.text :name, null: false

      t.timestamps null: false
    end
  end
end
