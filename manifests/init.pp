# == Class: heat
#
#  Heat base package & configuration
#
# === Parameters
#
# [*package_ensure*]
#    (Optional) Ensure state for package.
#    Defaults to 'present'
#
# [*debug*]
#   (Optional) Should the daemons log debug messages
#   Defaults to undef.
#
# [*log_dir*]
#   (Optional) Directory where logs should be stored
#   If set to boolean 'false', it will not log to any directory
#   Defaults to undef.
#
# [*default_transport_url*]
#    (optional) A URL representing the messaging driver to use and its full
#    configuration. Transport URLs take the form:
#      transport://user:pass@host1:port[,hostN:portN]/virtual_host
#    Defaults to $::os_service_default
#
# [*rpc_backend*]
#   (Optional) Use these options to configure the message system.
#   Defaults to $::os_service_default.
#
# [*rpc_response_timeout*]
#   (Optional) Configure the timeout (in seconds) for rpc responses
#   Defaults to $::os_service_default.
#
# [*rabbit_host*]
#   (Optional) IP or hostname of the rabbit server.
#   Defaults to $::os_service_default.
#
# [*rabbit_port*]
#   (Optional) Port of the rabbit server.
#   Defaults to $::os_service_default.
#
# [*rabbit_hosts*]
#   (Optional) Array of host:port (used with HA queues).
#   If defined, will remove rabbit_host & rabbit_port parameters from config
#   Defaults to $::os_service_default.
#
# [*rabbit_userid*]
#   (Optional) User to connect to the rabbit server.
#   Defaults to $::os_service_default.
#
# [*rabbit_password*]
#   (Optional) Password to connect to the rabbit_server.
#   Defaults to $::os_service_default.
#
# [*rabbit_virtual_host*]
#   (Optional) Virtual_host to use.
#   Defaults to $::os_service_default.
#
# [*rabbit_ha_queues*]
#   (optional) Use HA queues in RabbitMQ (x-ha-policy: all).
#   Defaults to $::os_service_default.
#
# [*rabbit_heartbeat_timeout_threshold*]
#   (optional) Number of seconds after which the RabbitMQ broker is considered
#   down if the heartbeat keepalive fails.  Any value >0 enables heartbeats.
#   Heartbeating helps to ensure the TCP connection to RabbitMQ isn't silently
#   closed, resulting in missed or lost messages from the queue.
#   (Requires kombu >= 3.0.7 and amqp >= 1.4.0)
#   Defaults to 0
#
# [*rabbit_heartbeat_rate*]
#   (optional) How often during the rabbit_heartbeat_timeout_threshold period to
#   check the heartbeat on RabbitMQ connection.  (i.e. rabbit_heartbeat_rate=2
#   when rabbit_heartbeat_timeout_threshold=60, the heartbeat will be checked
#   every 30 seconds.
#   Defaults to $::os_service_default.
#
# [*rabbit_use_ssl*]
#   (Optional) Connect over SSL for RabbitMQ.
#   Defaults to $::os_service_default.
#
# [*kombu_ssl_ca_certs*]
#   (Optional) SSL certification authority file (valid only if SSL enabled).
#   Defaults to $::os_service_default.
#
# [*kombu_ssl_certfile*]
#   (Optional) SSL cert file (valid only if SSL enabled).
#   Defaults to $::os_service_default.
#
# [*kombu_ssl_keyfile*]
#   (Optional) SSL key file (valid only if SSL enabled).
#   Defaults to $::os_service_default.
#
# [*kombu_ssl_version*]
#   (Optional) SSL version to use (valid only if SSL enabled).
#   Valid values are TLSv1, SSLv23 and SSLv3. SSLv2 may be
#   available on some distributions.
#   Defaults to $::os_service_default.
#
# [*kombu_reconnect_delay*]
#   (Optional) How long to wait before reconnecting in response
#   to an AMQP consumer cancel notification. (floating point value)
#   Defaults to $::os_service_default
#
# [*kombu_failover_strategy*]
#   (Optional) Determines how the next RabbitMQ node is chosen in case the one
#   we are currently connected to becomes unavailable. Takes effect only if
#   more than one RabbitMQ node is provided in config. (string value)
#   Defaults to $::os_service_default
#
# [*kombu_compression*]
#   (optional) Possible values are: gzip, bz2. If not set compression will not
#   be used. This option may notbe available in future versions. EXPERIMENTAL.
#   (string value)
#   Defaults to $::os_service_default
#
# [*amqp_durable_queues*]
#   (Optional) Use durable queues in amqp.
#   Defaults to $::os_service_default.
#
# [*amqp_server_request_prefix*]
#   (Optional) Address prefix used when sending to a specific server
#   Defaults to $::os_service_default.
#
# [*amqp_broadcast_prefix*]
#   (Optional) address prefix used when broadcasting to all servers
#   Defaults to $::os_service_default.
#
# [*amqp_group_request_prefix*]
#   (Optional) address prefix when sending to any server in group
#   Defaults to $::os_service_default.
#
# [*amqp_container_name*]
#   (Optional) Name for the AMQP container
#   Defaults to $::os_service_default.
#
# [*amqp_idle_timeout*]
#   (Optional) Timeout for inactive connections
#   Defaults to $::os_service_default.
#
# [*amqp_trace*]
#   (Optional) Debug: dump AMQP frames to stdout
#   Defaults to $::os_service_default.
#
# [*amqp_ssl_ca_file*]
#   (Optional) CA certificate PEM file to verify server certificate
#   Defaults to $::os_service_default.
#
# [*amqp_ssl_cert_file*]
#   (Optional) Identifying certificate PEM file to present to clients
#   Defaults to $::os_service_default.
#
# [*amqp_ssl_key_file*]
#   (Optional) Private key PEM file used to sign cert_file certificate
#   Defaults to $::os_service_default.
#
# [*amqp_ssl_key_password*]
#   (Optional) Password for decrypting ssl_key_file (if encrypted)
#   Defaults to $::os_service_default.
#
# [*amqp_allow_insecure_clients*]
#   (Optional) Accept clients using either SSL or plain TCP
#   Defaults to $::os_service_default.
#
# [*amqp_sasl_mechanisms*]
#   (Optional) Space separated list of acceptable SASL mechanisms
#   Defaults to $::os_service_default.
#
# [*amqp_sasl_config_dir*]
#   (Optional) Path to directory that contains the SASL configuration
#   Defaults to $::os_service_default.
#
# [*amqp_sasl_config_name*]
#   (Optional) Name of configuration file (without .conf suffix)
#   Defaults to $::os_service_default.
#
# [*amqp_username*]
#   (Optional) User name for message broker authentication
#   Defaults to $::os_service_default.
#
# [*amqp_password*]
#   (Optional) Password for message broker authentication
#   Defaults to $::os_service_default.
#
# [*max_template_size*]
#   (Optional) Maximum raw byte size of any template.
#   Defaults to $::os_service_default
#
# [*max_json_body_size*]
#   (Optional) Maximum raw byte size of JSON request body.
#   Should be larger than max_template_size.
#   Defaults to $::os_service_default
#
# [*notification_transport_url*]
#   (optional) A URL representing the messaging driver to use for notifications
#   and its full configuration. Transport URLs take the form:
#     transport://user:pass@host1:port[,hostN:portN]/virtual_host
#   Defaults to $::os_service_default
#
# [*notification_driver*]
#   (Optional) Driver or drivers to handle sending notifications.
#   Value can be a string or a list.
#   Defaults to $::os_service_default
#
# == keystone authentication options
#
# [*auth_uri*]
#   (Optional) Specifies the public Identity URI for Heat to use.
#   Located in heat.conf.
#   Defaults to: 'http://127.0.0.1:5000/'.
#
# [*identity_uri*]
#   (Optional) Specifies the admin Identity URI for Heat to use.
#   Located in heat.conf.
#   Defaults to: 'http://127.0.0.1:35357/'.
#
# [*auth_plugin*]
#   Specifies the plugin used for authentication.
#   Defaults to undef.
#
# [*keystone_user*]
#   Defaults to 'heat'.
#
# [*keystone_tenant*]
#   Defaults to 'services'.
#
# [*keystone_password*]
#
# [*keystone_project_domain_name*]
#   Specifies the project domain of Keystone account for "password" auth_plugin.
#   Defaults to 'Default'.
#
# [*keystone_user_domain_id*]
#   (Optional) Domain ID of the principal if the principal has a domain.
#   Defaults to: 'Default'.
#
# [*keystone_user_domain_name*]
#   Defaults to 'Default'.
#
# [*keystone_project_domain_id*]
#   (Optional) Domain ID of the scoped project if auth is project-scoped.
#   Defaults to: 'Default'.
#
# [*keystone_ec2_uri*]
#
# [*database_connection*]
#   (optional) Connection url for the heat database.
#   Defaults to undef.
#
# [*database_max_retries*]
#   (optional) Maximum database connection retries during startup.
#   Defaults to undef.
#
# [*database_idle_timeout*]
#   (optional) Timeout before idle database connections are reaped.
#   Defaults to undef.
#
# [*database_retry_interval*]
#   (optional) Interval between retries of opening a database connection.
#   Defaults to undef.
#
# [*database_min_pool_size*]
#   (optional) Minimum number of SQL connections to keep open in a pool.
#   Defaults to undef.
#
# [*database_max_pool_size*]
#   (optional) Maximum number of SQL connections to keep open in a pool.
#   Defaults to undef.
#
# [*database_max_overflow*]
#   (optional) If set, use this value for max_overflow with sqlalchemy.
#   Defaults to: undef.

# [*use_syslog*]
#   (Optional) Use syslog for logging.
#   Defaults to undef.
#
# [*use_stderr*]
#   (optional) Use stderr for logging
#   Defaults to undef.
#
# [*log_facility*]
#   (Optional) Syslog facility to receive log lines.
#   Defaults to undef.
#
# [*flavor*]
#   (optional) Specifies the Authentication method.
#   Set to 'standalone' to get Heat to work with a remote OpenStack
#   Tested versions include 0.9 and 2.2
#   Defaults to $::os_service_default.
#
# [*region_name*]
#   (Optional) Region name for services. This is the
#   default region name that heat talks to service endpoints on.
#   Defaults to $::os_service_default.
#
# [*enable_stack_adopt*]
#   (Optional) Enable the stack-adopt feature.
#   Defaults to $::os_service_default.
#
# [*enable_stack_abandon*]
#   (Optional) Enable the stack-abandon feature.
#   Defaults to $::os_service_default.
#
# [*sync_db*]
#   (Optional) Run db sync on nodes after connection setting has been set.
#   Defaults to true
#
# [*enable_proxy_headers_parsing*]
#   (Optional) Enable paste middleware to handle SSL requests through
#   HTTPProxyToWSGI middleware.
#   Defaults to $::os_service_default.
#
# [*heat_clients_url*]
#   (optional) Heat url in format like http://0.0.0.0:8004/v1/%(tenant_id)s.
#   Defaults to $::os_service_default.
#
# [*purge_config*]
#   (optional) Whether to set only the specified config options
#   in the heat config.
#   Defaults to false.
#
# DEPRECATED PARAMETERS
#
# [*verbose*]
#   (Optional) Deprecated. Should the daemons log verbose messages
#   Defaults to undef.
#
class heat(
  $auth_uri                           = 'http://127.0.0.1:5000/',
  $identity_uri                       = 'http://127.0.0.1:35357/',
  $package_ensure                     = 'present',
  $debug                              = undef,
  $log_dir                            = undef,
  $auth_plugin                        = undef,
  $keystone_user                      = 'heat',
  $keystone_tenant                    = 'services',
  $keystone_password                  = false,
  $keystone_ec2_uri                   = 'http://127.0.0.1:5000/v2.0/ec2tokens',
  $keystone_project_domain_id         = 'Default',
  $keystone_project_domain_name       = 'Default',
  $keystone_user_domain_id            = 'Default',
  $keystone_user_domain_name          = 'Default',
  $default_transport_url              = $::os_service_default,
  $rpc_backend                        = $::os_service_default,
  $rpc_response_timeout               = $::os_service_default,
  $rabbit_host                        = $::os_service_default,
  $rabbit_port                        = $::os_service_default,
  $rabbit_hosts                       = $::os_service_default,
  $rabbit_userid                      = $::os_service_default,
  $rabbit_password                    = $::os_service_default,
  $rabbit_virtual_host                = $::os_service_default,
  $rabbit_ha_queues                   = $::os_service_default,
  $rabbit_heartbeat_timeout_threshold = 0,
  $rabbit_heartbeat_rate              = $::os_service_default,
  $rabbit_use_ssl                     = $::os_service_default,
  $kombu_ssl_ca_certs                 = $::os_service_default,
  $kombu_ssl_certfile                 = $::os_service_default,
  $kombu_ssl_keyfile                  = $::os_service_default,
  $kombu_ssl_version                  = $::os_service_default,
  $kombu_reconnect_delay              = $::os_service_default,
  $kombu_failover_strategy            = $::os_service_default,
  $kombu_compression                  = $::os_service_default,
  $amqp_durable_queues                = $::os_service_default,
  $amqp_server_request_prefix         = $::os_service_default,
  $amqp_broadcast_prefix              = $::os_service_default,
  $amqp_group_request_prefix          = $::os_service_default,
  $amqp_container_name                = $::os_service_default,
  $amqp_idle_timeout                  = $::os_service_default,
  $amqp_trace                         = $::os_service_default,
  $amqp_ssl_ca_file                   = $::os_service_default,
  $amqp_ssl_cert_file                 = $::os_service_default,
  $amqp_ssl_key_file                  = $::os_service_default,
  $amqp_ssl_key_password              = $::os_service_default,
  $amqp_allow_insecure_clients        = $::os_service_default,
  $amqp_sasl_mechanisms               = $::os_service_default,
  $amqp_sasl_config_dir               = $::os_service_default,
  $amqp_sasl_config_name              = $::os_service_default,
  $amqp_username                      = $::os_service_default,
  $amqp_password                      = $::os_service_default,
  $use_syslog                         = undef,
  $use_stderr                         = undef,
  $log_facility                       = undef,
  $database_connection                = undef,
  $database_max_retries               = undef,
  $database_idle_timeout              = undef,
  $database_retry_interval            = undef,
  $database_min_pool_size             = undef,
  $database_max_pool_size             = undef,
  $database_max_overflow              = undef,
  $flavor                             = $::os_service_default,
  $region_name                        = $::os_service_default,
  $enable_stack_adopt                 = $::os_service_default,
  $enable_stack_abandon               = $::os_service_default,
  $sync_db                            = undef,
  $max_template_size                  = $::os_service_default,
  $max_json_body_size                 = $::os_service_default,
  $notification_transport_url         = $::os_service_default,
  $notification_driver                = $::os_service_default,
  $enable_proxy_headers_parsing       = $::os_service_default,
  $heat_clients_url                   = $::os_service_default,
  $purge_config                       = false,
  # Deprecated
  $verbose                            = undef,
) {

  include ::heat::logging
  include ::heat::db
  include ::heat::deps
  include ::heat::params

  if $verbose {
    warning('verbose is deprecated, has no effect and will be removed after Newton cycle.')
  }

  package { 'heat-common':
    ensure => $package_ensure,
    name   => $::heat::params::common_package_name,
    tag    => ['openstack', 'heat-package'],
  }

  resources { 'heat_config':
    purge => $purge_config,
  }

  if $rpc_backend == 'rabbit' or is_service_default($rpc_backend) {
    if $rabbit_heartbeat_timeout_threshold == 0 {
      warning('Default value for rabbit_heartbeat_timeout_threshold parameter is different from OpenStack project defaults')
    }

    oslo::messaging::rabbit { 'heat_config':
      kombu_ssl_version           => $kombu_ssl_version,
      kombu_ssl_keyfile           => $kombu_ssl_keyfile,
      kombu_ssl_certfile          => $kombu_ssl_certfile,
      kombu_ssl_ca_certs          => $kombu_ssl_ca_certs,
      kombu_reconnect_delay       => $kombu_reconnect_delay,
      kombu_failover_strategy     => $kombu_failover_strategy,
      kombu_compression           => $kombu_compression,
      rabbit_userid               => $rabbit_userid,
      rabbit_password             => $rabbit_password,
      rabbit_virtual_host         => $rabbit_virtual_host,
      heartbeat_timeout_threshold => $rabbit_heartbeat_timeout_threshold,
      heartbeat_rate              => $rabbit_heartbeat_rate,
      rabbit_use_ssl              => $rabbit_use_ssl,
      amqp_durable_queues         => $amqp_durable_queues,
      rabbit_host                 => $rabbit_host,
      rabbit_port                 => $rabbit_port,
      rabbit_hosts                => $rabbit_hosts,
      rabbit_ha_queues            => $rabbit_ha_queues,
    }
  }
  elsif $rpc_backend == 'amqp' {
    oslo::messaging::amqp { 'heat_config':
      server_request_prefix  => $amqp_server_request_prefix,
      broadcast_prefix       => $amqp_broadcast_prefix,
      group_request_prefix   => $amqp_group_request_prefix,
      container_name         => $amqp_container_name,
      idle_timeout           => $amqp_idle_timeout,
      trace                  => $amqp_trace,
      ssl_ca_file            => $amqp_ssl_ca_file,
      ssl_cert_file          => $amqp_ssl_cert_file,
      ssl_key_file           => $amqp_ssl_key_file,
      ssl_key_password       => $amqp_ssl_key_password,
      allow_insecure_clients => $amqp_allow_insecure_clients,
      sasl_mechanisms        => $amqp_sasl_mechanisms,
      sasl_config_dir        => $amqp_sasl_config_dir,
      sasl_config_name       => $amqp_sasl_config_name,
      username               => $amqp_username,
      password               => $amqp_password,
    }
  }

  if $auth_plugin {
    if $auth_plugin == 'password' {
      heat_config {
        'keystone_authtoken/auth_url':          value => $identity_uri;
        'keystone_authtoken/auth_plugin':       value => $auth_plugin;
        'keystone_authtoken/username':          value => $keystone_user;
        'keystone_authtoken/password':          value => $keystone_password, secret => true;
        'keystone_authtoken/user_domain_id':    value => $keystone_user_domain_id;
        'keystone_authtoken/project_name':      value => $keystone_tenant;
        'keystone_authtoken/project_domain_id': value => $keystone_project_domain_id;
      }
    } else {
      fail('Currently only "password" auth_plugin is supported.')
    }
  } else {
    warning('"admin_user", "admin_password", "admin_tenant_name" configuration options are deprecated in favor of auth_plugin and related options')
    heat_config {
      'keystone_authtoken/auth_uri':          value => $auth_uri;
      'keystone_authtoken/identity_uri':      value => $identity_uri;
      'keystone_authtoken/admin_tenant_name': value => $keystone_tenant;
      'keystone_authtoken/admin_user':        value => $keystone_user;
      'keystone_authtoken/admin_password':    value => $keystone_password, secret => true;
    }
  }

  heat_config {
    'trustee/auth_plugin':       value => 'password';
    'trustee/auth_url':          value => $identity_uri;
    'trustee/username':          value => $keystone_user;
    'trustee/password':          value => $keystone_password, secret => true;
    'trustee/project_domain_id': value => $keystone_project_domain_id;
    'trustee/user_domain_id':    value => $keystone_user_domain_id;

    'clients_keystone/auth_uri': value => $identity_uri;
    'clients_heat/url':          value => $heat_clients_url;
  }

  if (!is_service_default($enable_stack_adopt)) {
    validate_bool($enable_stack_adopt)
  }

  if (!is_service_default($enable_stack_abandon)) {
    validate_bool($enable_stack_abandon)
  }

  heat_config {
    'DEFAULT/max_template_size':            value => $max_template_size;
    'DEFAULT/max_json_body_size':           value => $max_json_body_size;
    'DEFAULT/region_name_for_services':     value => $region_name;
    'DEFAULT/enable_stack_abandon':         value => $enable_stack_abandon;
    'DEFAULT/enable_stack_adopt':           value => $enable_stack_adopt;
    'ec2authtoken/auth_uri':                value => $keystone_ec2_uri;
    'paste_deploy/flavor':                  value => $flavor;
  }

  oslo::messaging::notifications { 'heat_config':
    transport_url => $notification_transport_url,
    driver        => $notification_driver,
  }

  oslo::messaging::default { 'heat_config':
    transport_url        => $default_transport_url,
    rpc_response_timeout => $rpc_response_timeout,
  }

  oslo::middleware { 'heat_config':
    enable_proxy_headers_parsing => $enable_proxy_headers_parsing,
  }

}
