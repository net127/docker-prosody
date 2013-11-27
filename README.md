docker-prosody
==============

Prosody is a modern XMPP communication server. It aims to be easy to set up and configure, and efficient with system resources. Additionally, for developers it aims to be easy to extend and give a flexible system on which to rapidly develop added functionality, or prototype new protocols. 

Source: https://index.docker.io/u/nolan/prosody/

nolan/prosody

Short Description

    The Prosody XMPP server version 0.9.1

Full Description

    This is a minimally-configured Prosody instance. It is left bare so it may both serve as a minimal chat server, and be used in external services that might benefit from an XMPP server. The only changes made are theoretically intended to boost performance, especially since Docker grants easy control over the run environment such that features such as the Libev backend can be automatically enabled. Configuration was changed thusly:

        use_libevent was set to true.
        Prosody looks for SSL certificates in /etc/ssl/certs/ssl.key and /etc/ssl/certs/ssl.cert.
        c2srequireencryption was set to true.
        Authentication was set to use the internal_hashed backend so passwords aren't stored in the clear.
        Daemonize was set to false, and logs go to the console.
        Additional configuration files are read from /etc/prosody/conf.d/*.cfg.lua.

    To use:

        Create an image derived from this one.
            Add additional configuration in /etc/conf.d/.
        Add SSL certificates in the specified directories.
        Call "docker run -h -v /var/lib/prosody -p :5222 -p :5269 -p :5280 ". Omit "-p :5280" if you don't wish to expose Prosody's HTTP server. Omit "-v /var/lib/prosody" if you don't care about persisting Prosody's data between containers.

    Congratulations, you now have a running Prosody server!
