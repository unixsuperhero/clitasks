require 'fileutils'
require 'pathname'
require 'singleton'
require 'yaml'
require 'active_support'
require 'active_support/core_ext'

if ENV['CLIT_ENV'] == 'test'
  require './lib/clitasks/configuration'
  require './lib/clitasks/world'
  require './lib/clitasks/simple_dsl'
  require './lib/clitasks/story_reader'
  require './lib/clitasks/story'
  require './lib/clitasks/runner'
  require './lib/clitasks/link_builder'
  require './lib/clitasks/viewer'
  require './lib/clitasks/version'
  require './lib/clitasks/commands'
else
  require 'clitasks/configuration'
  require 'clitasks/world'
  require 'clitasks/simple_dsl'
  require 'clitasks/story_reader'
  require 'clitasks/story'
  require 'clitasks/runner'
  require 'clitasks/link_builder'
  require 'clitasks/viewer'
  require 'clitasks/version'
  require 'clitasks/commands'
end

module CliTasks
end

