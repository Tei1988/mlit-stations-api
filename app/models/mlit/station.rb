# frozen_string_literal: true
module Mlit
  class Station
    include Virtus.model

    attribute :original_signature, String
    attribute :railway_type, Integer
    attribute :service_provider_type, Integer
    attribute :railway_line_name, String
    attribute :operation_company, String
    attribute :station_name, String
    attribute :location_points, Array
  end
end
