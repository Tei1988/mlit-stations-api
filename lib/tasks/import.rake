Module.new do
  extend Rake::DSL
  extend self
  namespace :mlit do
    desc 'Import master xml file'

    task :import, %w(filepath)
    task import: :environment do |_task, args|
      if args[:filepath].nil?
        raise ArgumentError, 'no filepath'
      end
      filepath = args[:filepath]

      parser = Mlit::StationParser.new(filepath: filepath)
      Mlit::StationImportService.new(parser: parser).execute
    end
  end
end
