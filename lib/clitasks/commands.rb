module CliTasks
  class Commands
    class << self
      def edit(*args)
        files = grep(*args)
        system(ENV['EDITOR'] || 'vim', *files)
      end

      def search(*args)
        if (args[0] || '').strip =~ /-(s|-simple)/i
          puts grep(*args.tap(&:shift))
        else
          CliTasks::Viewer.print(*grep(*args))
        end
      end

      def create(*args)
        name = args.join ' '
        timestamp = Time.now.strftime('%Y%m%d%H%M%S')
        filename = "./stories/index/#{timestamp}.rb"

        checklog("Creating '#{filename}'"){ IO.write(filename, template(name)) }
        checklog("Opening '#{filename}'"){ system(ENV['EDITOR'] || 'vim', filename) }
      end

      def rebuild
        CliTasks::LinkBuilder.all
      end

      def stories
        @stories ||= CliTasks::World.instance.stories
      end

      def list(*args)
        if args.any?
          CliTasks::Viewer.print *args
        else
          CliTasks::Viewer.print 'stories/index/*'
        end
      end

      private

      def grep(*args)
        args.inject(['stories/index']){|files,arg|
          #pp     "grep -ril '#{arg}' -- '#{files.join "' '"}'"
          grep = `grep -ril '#{arg}' -- '#{files.join "' '"}'`
          lines = grep.lines.map(&:chomp)
        }
      end

      def checklog(msg, &block)
        print "#{msg}..."
        block.call
        puts 'done'
      end

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
        pattern = data.scan(/\A(\s+)/).uniq.min_by{|s| s.length }.first
        data.gsub(/^#{pattern}/, '')
      end
    end
  end
end
