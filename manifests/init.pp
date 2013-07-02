# Class: j2se
#
# This module manages j2se
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class j2se {
        exec {
          "download" :
            cwd => "/tmp",
            command => "/usr/bin/wget --no-check-certificate --no-cookies --header 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com' 'http://download.oracle.com/otn-pub/java/jdk/7u25-b15/jre-7u25-linux-x64.tar.gz'", 
            creates => "/tmp/jre-7u25-linux-x64.tar.gz";

           "apps_unpack_j2se" :
              cwd => "/opt",
              command => "/bin/tar -zxf /tmp/jre-7u25-linux-x64.tar.gz",
              creates => "/opt/jre1.7.0_25",
              require => [ Exec["download"]  ];
        }

        file {  "/usr/bin/java" :
          ensure => symlink,
          target => "/opt/jre1.7.0_25/bin/java",
          require => [ Exec["apps_unpack_j2se"] ];
        }
}
