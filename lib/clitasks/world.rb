require 'singleton'

module CliTasks
  class World
    include Singleton
    attr_writer :stories

    def reset
      @stories = []
    end

    def stories
      @stories ||= []
    end
  end
end
