module CliTasks
  class Runner
    def self.run(files=Dir['examples/**/*_story.rb'])
      files.map{|f| load File.expand_path(f) }
    end
  end
end
