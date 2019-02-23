# Debian Supervisor Daemon

## Add programs

Copy configuration files to

``/etc/supervisor/conf.d/``

Supervisord includes all ``*.conf`` files from that place.

## Bash Substitution

Change ``supervisord.conf.template`` according your needs.

Built-in environment variables you can change:

* ``SUPERVISOR_IDENTIFIER``
* ``SUPERVISOR_LOGLEVEL``
* ``SUPERVISOR_USER``

Substitution runs before supervisord starts.
