module CliTasks
  class Runner
    def self.run(files='examples/**/*_story.rb')
      files = [files, '/**/*'].join if File.directory?(files)
      Dir[files].map{|f| load File.expand_path(f) }
    end
  end
end
