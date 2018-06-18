module Contentful
  class MigrationGenerator
  
    def initialize(name)
      @name = name
    end
    
    def filename
      "#{Time.now.utc.strftime('%Y%m%d%H%M%S')}_#{@name.underscore}.rb"
    end
    
    def create
      create_dir
      ::File.open(path.to_s, 'w+') { |f| f.write(template) }
    end
    
    def create_dir
      FileUtils.mkdir_p(dirname) unless ::File.directory?(dirname)
    end
    
    def dirname
      Rails.root.join('db', 'contentful')
    end
    
    def path
      Rails.root.join(dirname, filename)
    end
    
    def template
      <<~HEREDOC
      require 'contentful_model'
      
      class #{class_name}
        include ContentfulModel::Migrations::Migration
        
        def up
          \# Add your migration here
        end
      end
      HEREDOC
    end
    
    def class_name
      @name.classify
    end
    
  end
end
