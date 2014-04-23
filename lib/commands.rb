module CliTasks
  class Commands
    class << self
      def create(*args)
        name = ARGV[1]
        timestamp = Time.now.strftime('%Y%m%d%H%M%S')
        filename = "./stories/index/#{timestamp}.rb"

        print "Creating '#{filename}'..."

        IO.write(filename, template(name))

        puts 'done'

        puts "Opening '#{filename}'..."
        exec(ENV['EDITOR'] || 'vim', filename)
      end

      def rebuild
        LinkBuilder.all
      end

      def stories
        @stories ||= CliTasks::World.instance.stories
      end

      def list(*args)
        if args.any?
          CliTasks::Runner.run *args
        else
          CliTasks::Runner.run 'stories/index/*'
        end
        puts
        puts sprintf(" %-10s | %-20s | %-6s | %-60s | %-s", :status, :id, :points, :name, :tags)
        puts stories.sort_by{|s| s.name }.inject({}){|hash,s|
          hash.merge( s.status => hash.fetch(s.status, []) << s )
        }.map{|status,group|
          [sprintf(" %-10s | %-20s | %-6s | %-60s | %-s", ?-*10, ?-*20, ?-*6, ?-*60, ?-*20)] + group.map{|story|
            sprintf(" %-10s | %-20s | %-6s | %-60s | %-s", story.status, story.id, ?* * story.points.to_i, story.name.slice(0,60), Array(story.tags).join(', '))
          }
        }
      end

      private

      def template(name)
        data = <<-STORY
          story %q(#{name}) do
            status queued
            points 1
            created_by :unassigned
            assigned_to :unassigned
            tags *%w() # *%w(example example_two)

            description <<-DESCRIPTION
            DESCRIPTION

            comment :author, <<-COMMENT
            COMMENT
          end
        STORY
        pattern = data.scan(/\A(\s+)/).uniq.min_by{|s| s.length }.tap{|s|
          pp({ patterns: s })
        }.first
        data.gsub(/^#{pattern}/, '')
      end
    end
  end
end
