module CliTasks
  VERSION = '0.0.8' unless const_defined? :VERSION

  if ENV['CLIT_ENV'] == 'test'
    TEST_VERSION = '0.0.1' unless const_defined? :TEST_VERSION
  end
end
