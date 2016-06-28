# frozen_string_literal: true
module Api
  class StationsController < ApplicationController
    def index
      raise ArgumentError unless args.valid?
      stations = Station
                 .close_to(args.longitude, args.latitude, args.distance)
                 .lazy

      render json: {
        type: 'FeatureCollection',
        features: stations.map(&method(:to_feature))
      }
    end

    private

    def to_feature(station)
      railway_line = station.railway_line
      company = railway_line.company

      {
        type: 'Feature',
        geometry: RGeo::GeoJSON.encode(station.location),
        properties: {
          companyName: company.name,
          railwayLineName: railway_line.name,
          stationName: station.name
        }
      }
    end

    def args
      @args ||= Arguments::Station.new(params)
    end
  end
end
