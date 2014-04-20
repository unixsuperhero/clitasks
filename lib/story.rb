require 'pp'

module CliTasks
  class Story
    attr_reader :status, :name, :description, :created_by, :assigned_to, :comments, :tags
    def initialize(&block)
      instance_eval &block
    end

    def status(status)
      @status = status
    end

    def name(name)
      @name = name
    end

    def description(description)
      @description = description
    end

    def created_by(created_by)
      @created_by = created_by
    end

    def assigned_to(*args)
      @assigned_to = args
    end

    def comment(author, body)
      comments << {author: author, body: body}
    end

    def tags(*args)
      @tags = args
    end

    def comments
      @comments ||= []
    end
  end

  def story(&block)
    stories << Story.new(&block)
  end

  def stories
    @stories ||= []
  end
end

extend CliTasks
