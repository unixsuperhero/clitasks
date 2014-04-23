require 'pp'

module CliTasks
  class Story
    attr_accessor :file
    attr_reader :id, :status, :points, :name, :description
    def initialize(builder)
      builder.instance_variables.each{|name| instance_variable_set name, builder.instance_variable_get(name) }
    end

    def id
      @id ||= File.basename(file).sub(/[.]rb$/, '')
    end

    def tags
      @tags ||= []
    end

    def comments
      @comments ||= []
    end

    def created_by
      @created_by ||= []
      @created_by &&= Array(@created_by)
    end

    def assigned_to
      @assigned_to ||= []
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
    World.instance.stories
  end
end

extend CliTasks
