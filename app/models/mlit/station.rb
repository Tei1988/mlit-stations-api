# frozen_string_literal: true

module Mlit
  class Station
    include Virtus.model
    include ActiveModel::Validations

    attribute :original_signature, String
    attribute :railway_type, Integer
    attribute :service_provider_type, Integer
    attribute :railway_line_name, String
    attribute :operation_company, String
    attribute :station_name, String
    attribute :location_points, Array

    validates :original_signature, presence: true
    validates :railway_type, presence: true
    validates :service_provider_type, presence: true
    validates :railway_line_name, presence: true
    validates :operation_company, presence: true
    validates :station_name, presence: true
    validates :location_points, presence: true
  end
end
