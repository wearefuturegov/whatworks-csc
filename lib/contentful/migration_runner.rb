require_relative '../contentful_model/migrations/migration'

module Contentful
  class MigrationRunner
    
    def dirname
      Rails.root.join('db', 'contentful')
    end
    
    def run
      require_all
    end
    
    def require_all
      Dir["#{dirname}/*.rb"].each do |file|
        klass = extract_classname(file)
        require file
        Object.const_get(klass).new.up
      end
    end
    
    def extract_classname(path)
      basename = ::File.basename(path)
      basename.split('.').first.split('_').drop(1).join('_').classify
    end
    
  end
end
