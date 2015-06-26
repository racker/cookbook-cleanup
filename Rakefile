# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :
# Based on magic_shell cookbook code, thanks @sethvargo.

# More info at https://github.com/jimweirich/rake/blob/master/doc/rakefile.rdoc

require 'bundler/setup'

namespace :style do
  require 'rubocop/rake_task'
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:ruby)

  require 'foodcritic'
  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new(:chef)
end

desc 'Run all style checks'
task style: %w(style:chef style:ruby)

namespace :travis do
  desc 'Run tests on Travis'
  task ci: %w(style)
end

task default: %w(style)
