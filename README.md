Logrotate
=========

Installs and configures logrotate. Includes options to set up both daily and hourly log rotation. Heavily inspired by [nickhammond/ansible-logrotate](https://github.com/nickhammond/ansible-logrotate).

Requirements
------------

None.

Role Variables
--------------

__daily_scripts__: A list of logrotate scripts, defined as a dictionary, to use for daily rotation.

__hourly_scripts__: A list of logrotate scripts, defined as a dictionary, to use for hourly rotation.

Dictionary format:
* name - The name of the script that goes into `/etc/logrotate.d/` or `/etc/logrotate.hourly.d/`
* path - Path to point logrotate to for the log rotation
* options - List of directives for logrotate, view the logrotate man page for specifics
* scripts - Dict of scripts for logrotate (see Example below)

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: nmische.logrotate, 
             daily_scripts: [
               {
                  name: tomcat,
                  path: /var/log/tomcat/catalina.out,
                  options: [
                    rotate 3,
                    size 100M,
                    missingok,
                    notifempty,
                    delaycompress,
                    compress,
                    copytruncate
                  ]
               }
             ],
             hourly_scripts: [
               {
                 name: nginx,
                 path: /var/log/nginx/*.log,
                 options: [
                   weekly,
                   size 25M,
                   rotate 7,
                   missingok,
                   compress,
                   delaycompress,
                   copytruncate,
                 ],
                 scripts: {
                   postrotate: [
                     "[ -s /run/nginx.pid ] && kill -USR1 `cat /run/nginx.pid`"
                   ]
                 }
               }
             ]
           }

License
-------

The MIT License (MIT)


Author Information
------------------

Nathan Mische
