require 'pp'

module CliTasks
  class Story
    attr_reader :id, :status, :points, :name, :description, :created_by, :assigned_to, :comments, :tags
    def initialize(builder)
      builder.instance_variables.each{|name| instance_variable_set name, builder.instance_variable_get(name) }
    end

    def self.build(name, &block)
      Story.new StoryReader.new(name, &block)
    end
  end

  class SimpleDSL
    class << self
      def values(*names)
        names.each do |name|
          define_method(name) do
            "#{name}".to_sym
          end
        end
      end

      def fields(*names)
        names.each do |name|
          define_method(name) do |val|
            instance_variable_set "@#{name}".to_sym, val
          end
        end
      end

      def groups(*names)
        names.each do |name|
          define_method(name) do |*vals|
            instance_variable_set "@#{name}".to_sym, vals
          end
        end
      end

      def custom(*names, &block)
        names.each do |name|
          define_method(name, &block)
        end
      end
    end
  end

  class StoryReader < SimpleDSL
    def initialize(name, &block)
      @name = name
      instance_eval &block
    end

    values :queued, :started, :finished,
           :accepted, :rejected, :delivered

    fields :id, :status, :points, :description, :created_by
    groups :assigned_to, :tags
    custom :comment do |author, body| (@comments ||= []) << {author: author, body: body} end
  end

  def story(name, &block)
    stories << Story.build(name, &block)
  end

  def stories
    @stories ||= []
  end
end

extend CliTasks
