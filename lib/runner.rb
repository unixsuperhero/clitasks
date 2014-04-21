require './lib/world'

module CliTasks
  class Runner
    def self.run(*files)
      @world = CliTasks::World.instance
      files.flat_map{|file|
        Dir[File.directory?(file) && [file,'/**/*'].join || file]
      }.map{|file|
        load File.expand_path(file)
        @world.stories.last.file = file
      }
    end
  end
end
