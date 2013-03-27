require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
end

desc 'Setup development environment'
task :setup do
  sh 'git submodule init'
  sh 'git submodule update'
end

task :default => :test
