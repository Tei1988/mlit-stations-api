module Mlit
  class StationImportService
    include Virtus.model

    attribute :parser, Object

    def execute
      @parser.parse.each do |mlit_station|
        company = company(mlit_station)
        railway_line = railway_line(mlit_station, company)
        station(mlit_station, railway_line)
      end
    end

    private

    def company(mlit_station)
      params = { name: mlit_station.operation_company }
      Company.find_or_create_by(params) do |c|
        c.service_provider_type_id = mlit_station.service_provider_type
      end
    end

    def railway_line(mlit_station, company)
      params = { company: company, name: mlit_station.railway_line_name }
      RailwayLine.find_or_create_by(params) do |r|
        r.railway_type_id = mlit_station.railway_type
      end
    end

    def station(mlit_station, railway_line)
      params = { original_signature: mlit_station.original_signature }
      ::Station.find_or_create_by(params) do |s|
        location =
          [0.0, 0.0]
          .zip(*mlit_station.location_points.map(&:to_f).in_groups_of(2))
          .map { |v| v.reduce(&:+) / (v.length - 1) }
          .reverse

        s.railway_line = railway_line
        s.name = mlit_station.station_name
        s.location = "POINT(#{location.join(' ')})"
      end
    end
  end
end
