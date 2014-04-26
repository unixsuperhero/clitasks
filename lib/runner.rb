module CliTasks
  class Runner
    def self.run(*files)
      world.reset
      files.flat_map{|file|
        Dir[File.directory?(file) && [file,'/**/*'].join || file]
      }.map{|file|
        load File.expand_path(file)
        world.stories.last.file = file
      }
    end

    def self.world
      @world ||= CliTasks::World.instance
    end
  end
end
