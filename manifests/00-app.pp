
import '01-package_base.class.pp'
import '02-package_dev_tools.class.pp'
import '03-package_app_server.class.pp'
import '04-config_app_server.class.pp'

# Class['package_base']->Class['package_dev_tools']->Class['package_app_server']->Class['package_phpunit']->Class['config_app_server']

Class['package_base']->Class['package_dev_tools']->Class['package_app_server']->Class['config_app_server']

service
{
  'apache2.daemon':
    name    => 'apache2',
    ensure  => running,
    require => Class['config_app_server'],
}

Class['config_app_server'] ~> Service['apache2.daemon']

include package_base
include package_dev_tools
include package_app_server
include config_app_server
