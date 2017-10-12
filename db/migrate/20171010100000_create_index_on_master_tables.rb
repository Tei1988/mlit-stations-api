# frozen_string_literal: true

class CreateIndexOnMasterTables < ActiveRecord::Migration[5.1]
  def change
    add_index :stations, :original_signature, unique: true
    add_index :railway_lines, %i(company_id name), unique: true
    add_index :companies, :name, unique: true
  end
end
