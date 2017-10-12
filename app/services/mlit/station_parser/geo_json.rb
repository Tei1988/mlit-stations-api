# frozen_string_literal: true

module Mlit
  module StationParser
    class GeoJson
      include Virtus.model

      attribute :filepath, String

      def parse
        File.open(@filepath) do |f|
          features = RGeo::GeoJSON.decode(f, json_parser: :json)
          features.map do |feature|
            Mlit::Station.new(
              original_signature: original_signature(feature),
              railway_type: feature.properties['鉄道区分'],
              service_provider_type: feature.properties['事業者種別'],
              railway_line_name: feature.properties['路線名'],
              operation_company: feature.properties['運営会社'],
              station_name: feature.properties['駅名'],
              location_points: feature.geometry.coordinates.map(&:reverse).flatten,
            )
          end.select(&:valid?)
        end
      end

      private

      def original_signature(feature)
        Digest::MD5.hexdigest(
          "#{feature.properties['運営会社']}"\
          "#{feature.properties['路線名']}"\
          "#{feature.properties['駅名']}"
        )
      end
    end
  end
end
