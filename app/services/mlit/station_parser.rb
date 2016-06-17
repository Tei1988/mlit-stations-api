module Mlit
  class StationParser
    include Virtus.model;

    attribute :filepath, String

    def parse
      Enumerator.new do |results|
        File.open(@filepath) do |f|
          document = Oga.parse_xml(f)
          document.xpath('Dataset/Station').each do |element|
            location_link = element.xpath('location/@href').text.sub('#', '')
            results << Mlit::Station.new(
              original_signature: element.xpath('@id').text,
              railway_type: element.xpath('railwayType').text,
              service_provider_type: element.xpath('serviceProviderType').text,
              railway_line_name: element.xpath('railwayLineName').text,
              operation_company: element.xpath('operationCompany').text,
              station_name: element.xpath('stationName').text,
              location_points: document.xpath("Dataset/Curve[@id=\"#{location_link}\"]/segments/LineStringSegment/posList").text.split
            )
          end
        end
      end
    end
  end
end
