module CliTasks
  class Viewer
    def initialize(*args)
      @files = args
      if args.any?
        Runner.run *args
      else
        Runner.run 'stories/index/*'
      end
    end

    def self.print(*args)
      new(*args).print
    end

    def print
      puts header

      puts stories.reverse.inject({}){|hash,s|
        hash.merge( s.status => hash.fetch(s.status, []) << s )
      }.map{|status,group|
        [separator] + group.map{|s| story(s) }
      }
    end

    def header
      sprintf(" %-10s | %-20s | %-6s | %-60s | %-s", :status, :id, :points, :name, :tags)
    end

    def separator
      sprintf(" %-10s | %-20s | %-6s | %-60s | %-s", ?-*10, ?-*20, ?-*6, ?-*60, ?-*20)
    end

    def story(s)
      sprintf(" %-10s | %-20s | %-6s | %-60s | %-s", s.status, s.id, ?* * s.points.to_i, s.name.slice(0,60), Array(s.tags).join(', '))
    end

    def stories
      @stories ||= World.instance.stories
    end
  end
end
