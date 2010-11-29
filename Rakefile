require 'rubygems'
require 'bundler'

Bundler.require :default, :development

require 'rspec/core/rake_task'

Jeweler::Tasks.new do |s|
  s.name               = 'to_xls'
  s.email              = 'pat@freelancing-gods.com' 
  s.homepage           = 'http://github.com/freelancing-god/to_xls'
  s.summary            = 'Generate Excel Files in Rails'
  s.description        = 'A basic library for generating Excel files in Rails'
  s.authors            = ['Ary Djmal', 'Enrique García', 'Francisco Juan', 'Pat Allan']
  s.files              = FileList["{lib}/**/*", 'MIT-LICENSE', 'README.rdoc']
end

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
end
