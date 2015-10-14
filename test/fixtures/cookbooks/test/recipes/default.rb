#
# Cookbook Name:: test
# Recipe:: default
#
# License:: Apache License, Version 2.0
#

directory '/cleanup' do
  recursive true
end

%w(
  foo
  bar
  corge
  baz
  qux
).each do |f|
  file "/cleanup/#{f}" do
    content "#{f}\n"
    action :create
  end
end

cleanup '/cleanup/*' do
  keep_last 2
  except 'grault'
  sort_by :ctime
end

cleanup '/tmp/*' do
  older_than weeks: 1
end
