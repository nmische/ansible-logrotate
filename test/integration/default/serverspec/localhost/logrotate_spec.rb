require 'spec_helper'

describe file('/etc/logrotate.hourly.d') do
  it { should be_directory }
end

describe file('/etc/logrotate.hourly.conf') do
  it { should be_file }
end

describe file('/etc/cron.hourly/logrotate') do
  it { should be_file }
end

describe file('/etc/logrotate.d/tomcat') do
  it { should be_file }
  it { should contain '/var/log/tomcat/catalina.out' }
end

describe file('/etc/logrotate.hourly.d/nginx') do
  it { should be_file }
  it { should contain '/var/log/nginx/*.log' }
end

