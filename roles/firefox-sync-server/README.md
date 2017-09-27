firefox-sync-server
===================

This role maintains a Firefox Sync instance.

Requirements
------------

Requires Python 2, a working Apache server with *mod_ssl* or
*mod_nss*, and a MySQL server running on the same node.

Role Variables
--------------

 - `dev`: Suffix for development packages for your distribution. This is
   "devel" for RHEL or "dev" for Ubuntu.

 - `development_packages`: The packages which provide a C compiler,
   headers, and make in order to build syncserver.

 - `dir_apache2_conf`: Apache configuration root directory. This is
   /etc/apache2 on Ubuntu and /etc/httpd on RHEL.

 - `firefox_sync_database`: MySQL database used for syncserver.

 - `mysql_password`: Root password for the MySQL database. This should
   be stored in a vaulted file.

 - `pkg_mod_wsgi`: OS package containing *mod_wsgi*.

 - `pkg_virtualenv`: OS package providing virtualenv for Python 2.

 - `sync_database_user`: Database user that should be used for
   syncserver. This should not be root.

 - `sync_database_password`: Password for the user specified by
   `sync_database_user`. This should be different from the root password
   and stored in a vaulted file.

 - `sync_secret_token`: Token used by Firefox sync for cookies, etc.
   Should be stored in a vaulted file.

 - `www_fqdn`: Public FQDN of the Web server hosting the firefox-sync
   server.

Dependencies
------------

The `apache-base` role must be run before this role; the `apache-vhost`
role must be run in order for this server to be reachable from the
outside world.

Example Playbook
----------------

    - hosts: servers
      roles:
         - role: apache-base
         - role: letsencrypt-cert
         - role: firefox-sync-server
           firefox_sync_database: syncserver
           sync_database_user: syncserver
           sync_database_password: change!me
           sync_secret_token: C71A11CE1771E
         - role: apache-vhost

      vars:
          www_fqdn: patrickmacarthur.net

License
-------

BSD

Author Information
------------------

Patrick MacArthur <patrick@patrickmacarthur.net>
