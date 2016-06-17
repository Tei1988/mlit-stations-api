module Mlit
  class StationImportService
    include Virtus.model;

    attribute :parser, Object

    def execute
      @parser.parse.each do |mlit_station|
pp mlit_station
        company = Company.find_by(name: mlit_station.operation_company)
        if company.nil?
          company = Company.new(
            service_provider_type_id: mlit_station.service_provider_type,
            name: mlit_station.operation_company,
          )
          company.save!
        end
        pp company

        railway_line = RailwayLine.find_by(company: company, name: mlit_station.railway_line_name)
        if railway_line.nil?
          railway_line = RailwayLine.new(
            company: company,
            railway_type_id: mlit_station.railway_type,
            name: mlit_station.railway_line_name,
          )
          railway_line.save!
        end
        pp railway_line

        station = ::Station.find_by(original_signature: mlit_station.original_signature)
        if station.nil?
          station = ::Station.new(
            railway_line: railway_line,
            name: mlit_station.station_name,
            original_signature: mlit_station.original_signature,
            location: 'POINT(' + ([0.0, 0.0].zip(*mlit_station.location_points.map(&:to_f).in_groups_of(2)))
                                .map { |v| v.reduce(&:+) / (v.length - 1) }.reverse.join(' ') + ')'
          )
          station.save!
        end
        pp station
      end
    end
  end
end
