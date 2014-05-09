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
  s.files = Dir['**/*'].reject{|f|
    /^(doc|stories|tmp)/.match(f)
  }.keep_if{|f|
    File.file?(f)
  }
  s.executables = ['task']
  s.homepage = 'http://github.com/unixsuperhero/clitasks'
  s.license = 'MIT'

  s.add_runtime_dependency 'activesupport'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
end
