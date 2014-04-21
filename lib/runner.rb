module CliTasks
  class Runner
    def self.run(*files)
      files.flat_map{|file|
        file = [file, '/**/*'].join if File.directory?(file)
        Dir[file]
      }.map{|file| load File.expand_path(file) }
    end
  end
end
