# frozen_string_literal: true

module Mlit
  module StationParser
    class Xml
      include Virtus.model

      attribute :filepath, String

      def parse
        Enumerator.new do |results|
          File.open(@filepath) do |f|
            document = Oga.parse_xml(f)
            document.xpath('Dataset/Station').each do |element|
              mlit_station = transform(document, element)
              results << mlit_station if mlit_station.valid?
            end
          end
        end
      end

      private

      def transform(document, element)
        Mlit::Station.new(
          original_signature: original_signature(element),
          railway_type: railway_type(element),
          service_provider_type: service_provider_type(element),
          railway_line_name: railway_line_name(element),
          operation_company: operation_company(element),
          station_name: station_name(element),
          location_points: location_points(document),
        )
      end

      def original_signature(element)
        element.xpath('@id').text
      end

      def railway_type(element)
        element.xpath('railwayType').text
      end

      def service_provider_type(element)
        element.xpath('serviceProviderType').text
      end

      def railway_line_name(element)
        element.xpath('railwayLineName').text
      end

      def operation_company(element)
        element.xpath('operationCompany').text
      end

      def station_name(element)
        element.xpath('stationName').text
      end

      def location_points(element)
        location_link = element.xpath('location/@href').text.sub('#', '')
        element.xpath("Dataset/Curve[@id=\"#{location_link}\"]"\
                       '/segments/LineStringSegment/posList').text.split
      end
    end
  end
end
