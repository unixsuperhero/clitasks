module CliTasks
  class Runner
    def self.run(*files)
      files.flat_map{|file|
        Dir[File.directory?(file) && [file,'/**/*'].join || file]
      }.map{|file| load File.expand_path(file) }
    end
  end
end
