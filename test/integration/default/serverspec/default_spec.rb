# encoding: UTF-8
# License:: Apache License, Version 2.0
#

require_relative 'spec_helper'

describe file('/cleanup/foo') do
  it { should_not be_file }
end

describe file('/cleanup/bar') do
  it { should_not be_file }
end

describe file('/cleanup/corge') do
  it { should be_file }
end

describe file('/cleanup/baz') do
  it { should be_file }
end
describe file('/cleanup/qux') do
  it { should be_file }
end
