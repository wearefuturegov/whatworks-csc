require 'contentful/migration_generator'
require 'contentful/migration_runner'

namespace :contentful do
  namespace :migrations do
    
    desc 'Generate a Contentful migration'
    task :generate do
      ARGV.each { |a| task a.to_sym do; end } # rubocop:disable Style/BlockDelimiters
      Contentful::MigrationGenerator.new(ARGV[1]).create
    end
  
  end
  
  desc 'Run your Contentful migrations'
  task migrate: :environment do
    Contentful::MigrationRunner.new.run
  end
end
