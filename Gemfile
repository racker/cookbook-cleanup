# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

source 'https://rubygems.org'

group :plugins do
  gem 'vagrant-berkshelf', github: 'berkshelf/vagrant-berkshelf'
  gem 'vagrant-cachier', github: 'fgrehm/vagrant-cachier'
  gem 'vagrant-omnibus', github: 'schisamo/vagrant-omnibus'
end

group :style do
  gem 'foodcritic', '~> 3.0'
  gem 'rubocop', '~> 0.24'
end

group :test do
  gem 'berkshelf', '~> 3'
end

group :integration do
  gem 'kitchen-vagrant', '~> 0.18.0'
  gem 'test-kitchen', '~> 1.4.0'
end
