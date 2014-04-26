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
