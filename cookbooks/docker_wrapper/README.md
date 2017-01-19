# svops_docker Cookbook
=======================


This cookbook is a wrapper around community cookbook ( https://github.com/chef-cookbooks/docker ) to manage docker containers as a chef resource.

## Requirements

### Platforms

- Ubuntu 14.04
- Ubuntu 16.04

### Chef

- Chef 12.0 or later

### Cookbooks

- `docker` - svops_docker needs docker cookbook as it heavily extends the same with custom resource to simplyfy tasks.

## Attributes

Currently, the repo for the same is set as below, the target docker tar file will reside in http://preprod-repo.cloud.geip.ge.com//windows/predix/MQTT/my-container-img.tar

default['repo_url'] = 'http://preprod-repo.cloud.geip.ge.com'
default['repo_path'] = '/windows/predix/MQTT/'

### svops_docker::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['svops_docker']['repo_url']</tt></td>
    <td>String</td>
    <td>Repo base url</td>
    <td><tt>'http://preprod-repo.cloud.geip.ge.com'</tt></td>
  </tr>
  <tr>
    <td><tt>['svops_docker']['repo_path']</tt></td>
    <td>String</td>
    <td>Repo path/endpoint</td>
    <td><tt>'/windows/predix/MQTT/'</tt></td>
  </tr>
</table>

## Usage

### svops_docker::default

Currently custom resource supports below actions.

<table>
  <tr>
    <th>Action</th>
    <th>Parameters</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>:install</tt></td>
    <td>None</td>
    <td>Configures repository and installs Docker-engine and setsup env for docker-engine to work</td>
    <td><tt>''</tt></td>
  </tr>
  <tr>
    <td><tt>:import</tt></td>
    <td>image_name</td>
    <td>Downloads the image name from the central repo and imports the container image to local docker cache</td>
    <td><tt>''</tt></td>
  </tr>
  <tr>
    <td><tt>:run</tt></td>
    <td>image_name, Optional ( drive_map ['local_path:container_path'] to mount it inside container),port ['container_port:host_port'] )</td>
    <td>Runs the imported image_name with parameters given above, run is idempotent if the container is stopped or not running, it will restart the same </td>
    <td><tt>''</tt></td>
  </tr>
  <tr>
    <td><tt>:converge</tt></td>
    <td>image_name, Optional ( drive_map ['local_path:container_path'] to mount it inside container),port ['container_port:host_port'] )</td>
    <td>This is a mega/complex action, which combines all above. Installs docker engine on the host if missing, downloads the container image from the repo, imports the same and runs the container in one go. For all practical purpose, this is the one you should be using </td>
    <td><tt>''</tt></td>
  </tr>
</table>

e.g.

Just add  svops_docker as depends in your metadata.rb

and in recipe.

svops_docker_manage "ge-mqtt" do <br>
  action :converge <br>
  image_name "ge-mqtt" <br>
  entry_script '/usr/sbin/mosquitto -c /mqtt/config/mosquitto.conf' <br>
  drive_map ["/var/tmp:/var/tmp"] <br>
  ## any other parameters like port .. etc <br>
end
# svops_docker
# svops_docker
