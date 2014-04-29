module CliTasks
  class Configuration
    include Singleton
    attr_accessor :created_by
    def load(file='stories/config.yml')
      @file = file
      @created_by = config['created_by']
    end

    def config
      @config ||= YAML.load_file(@file)
    end
  end
end
