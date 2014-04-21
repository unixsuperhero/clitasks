require 'singleton'

module CliTasks
  class World
    include Singleton

    def stories
      @stories ||= []
    end
  end
end
