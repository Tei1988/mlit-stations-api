# frozen_string_literal: true

Module.new do
  extend Rake::DSL
  extend self
  namespace :mlit do
    desc 'Import master xml file'

    task :import, %w(filepath)
    task import: :environment do |_task, args|
      raise ArgumentError, 'no filepath' if args[:filepath].nil?
      filepath = args[:filepath]

      parser = Mlit::StationParser::GeoJson.new(filepath: filepath)
      Mlit::StationImportService.new(parser: parser).execute
    end
  end
end
