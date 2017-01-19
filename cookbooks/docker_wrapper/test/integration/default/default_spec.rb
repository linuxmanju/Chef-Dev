describe package('docker-engine') do
  it { should be_installed }
end

describe service('docker') do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end

describe command('docker ps') do
  its('exit_status') { should eq 0 }
end

describe file('/var/run/docker/libcontainerd/docker-containerd.sock') do
  it { should be_socket }
  its('owner') { should eq 'root' }
end
