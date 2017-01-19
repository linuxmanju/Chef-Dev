# specify in cookbook
default['geip_delivery_truck']['chef_publish']              = 'yes' # no or yes
default['geip_delivery_truck']['ec2_uai_tag']               = 'UAI2000169'
default['geip_delivery_truck']['ec2_instance_type']         = 't2.micro'
default['geip_delivery_truck']['ec2_ami_id']                = 'ami-c7e96fd0'
default['geip_delivery_truck']['ec2_login_user']            = 'ubuntu'
default['geip_delivery_truck']['ec2_connection_type']       = 'ssh'
default['geip_delivery_truck']['acceptance_provisioner']    = 'kitchen' # kitchen or terraform

## linux
# default['geip_delivery_truck']['ec2_instance_type'] = 't2.micro' # small
# default['geip_delivery_truck']['ec2_instance_type'] = 't2.large' # large
# default['geip_delivery_truck']['ec2_instance_type'] = 'm4.medium' # performance

## ubuntu
# default['geip_delivery_truck']['ec2_ami_id']          = 'ami-c7e96fd0'
# default['geip_delivery_truck']['ec2_login_user']      = 'ubuntu'
# default['geip_delivery_truck']['ec2_connection_type'] = 'ssh'

## centos6
# default['geip_delivery_truck']['ec2_ami_id']          = 'ami-79f6706e'
# default['geip_delivery_truck']['ec2_login_user']      = 'gecloud'
# default['geip_delivery_truck']['ec2_connection_type'] = 'ssh'

## centos7
# default['geip_delivery_truck']['ec2_ami_id']          = 'ami-5910924e'
# default['geip_delivery_truck']['ec2_login_user']      = 'gecloud'
# default['geip_delivery_truck']['ec2_connection_type'] = 'ssh'

## windows
# default['geip_delivery_truck']['ec2_ami_id']          = 'ami-bade19d7'
# default['geip_delivery_truck']['ec2_login_user']      = 'Administrator'
# default['geip_delivery_truck']['ec2_connection_type'] = 'winrm'
# default['geip_delivery_truck']['ec2_instance_type']   = 'm4.large'
