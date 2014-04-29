module CliTasks
  class World
    include Singleton
    attr_writer :stories

    def configuration
      @configuration ||= Configuration.instance.tap(&:load)
    end

    def reset
      @stories = []
    end

    def stories
      @stories ||= []
    end
  end
end
