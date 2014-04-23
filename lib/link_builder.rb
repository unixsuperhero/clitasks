require 'fileutils'
require 'pathname'
require './lib/runner'
require './lib/world'

class LinkBuilder
  attr_reader :world
  def initialize(path='stories')
    @path = path
    @world = CliTasks::World.instance
    CliTasks::Runner.run [path, 'index'].join(?/)
  end

  def self.all
    LinkBuilder.new.tap do |links|
      links.by_tag
      links.by_status
      links.by_creator
      links.by_assignment
    end
  end

  def by_tag
    FileUtils.rm_r(File.join(@path, 'tags'), force: true)
    world.stories.each do |story|
      story.tags.each do |tag|
        tag = sanitize(tag) || next
        dest = File.join(@path, 'tags', tag)
        link story, dest
      end
    end
  end

  def by_status
    FileUtils.rm_r(File.join(@path, 'status'), force: true)
    world.stories.each do |story|
      status = sanitize(story.status)
      dest = File.join(@path, 'status', status)
      link story, dest
    end
  end

  def by_creator
    FileUtils.rm_r(File.join(@path, 'created_by'), force: true)
    world.stories.each do |story|
      Array(story.created_by).each do |creator|
        creator = sanitize(creator) || next
        dest = File.join(@path, 'created_by', creator)
        link story, dest
      end
    end
  end

  def by_assignment
    FileUtils.rm_r(File.join(@path, 'assigned_to'), force: true)
    world.stories.each do |story|
      Array(story.assigned_to).each do |assignment|
        assignment = sanitize(assignment) || next
        dest = File.join(@path, 'assigned_to', assignment)
        link story, dest
      end
    end
  end

  private

  def sanitize(name)
    return unless name.is_a?(String) || name.is_a?(Symbol)
    String(name).gsub(/\W+/, '_')
  end

  def link(story, dest)
    FileUtils.mkdir_p File.expand_path(dest)
    src = Pathname.new(File.expand_path(story.file))
    FileUtils.ln_s src.relative_path_from(Pathname.new(File.expand_path(dest))), File.join(dest, sanitize(story.name))
  end
end
