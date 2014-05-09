require File.expand_path("../lib/clitasks/version", __FILE__)

Gem::Specification.new do |s|
  s.name = 'clitasks'
  s.summary = 'CLI Tasks'
  s.description = 'File-based, command-line project manager.'
  s.version = CliTasks::VERSION
  s.date = '2014-04-26'
  s.authors = ['Joshua "unixsuperhero" Toyota']
  s.email = 'jearsh@gmail.com'
  s.files = Dir['lib/**/*'] + Dir['test/**/*_test.rb'] + [
    'bin/task',
    'Rakefile',
  ]
  s.executables = ['task']
  s.homepage = 'http://github.com/unixsuperhero/clitasks'
  s.license = 'MIT'
end
