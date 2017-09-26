# bronsenproject.nl

This domain has of a number of subdomains:

* admin.bronsenproject.nl
* www.bronsenproject.nl
* boekhouding.bronsenproject.nl
* webmail.bronsenproject.nl

# Configuration

There are several services available on haakma.org.

* Apache2 - you can locate the apache configuration in:
  * bronsenproject.nl-site/apache2
    * admin-bronsenproject-nl.conf
    * www-bronsenproject-nl.conf
  * bronsenproject.nl-webmail/apache2
    * webmail-bronsenproject-nl.conf
  * bronsenproject.nl-boekhouding/apache2
    * boekhouding-bronsenproject-nl.conf
* Dovecot
  * This is in the daily backup cycle
* Postfix
  * This is in the daily backup cycle
* MySQL
  * Configuration is found in bronsenproject.nl-mysql. In the docker-compose file the MySQL-server is setup. 

## Backup

Each day around 9:00 PM the backup is executed on [jenkins.haakma.org](http://jenkins.haakma.org/job/bronsenproject-nl/job/bronsenproject-nl/).
The backups are located on the host:

* /home/#user#/backup/#domain#/#domain#_#subdomain#.tar
* /home/#user#/backup/#domain#/#domain#_#subdomain#.sql
* /home/#user#/backup/#domain#/#domain#_#dovecot#.tar
* /home/#user#/backup/#domain#/#domain#_#postfix#.sql
* /home/#user#/backup/#domain#/#domain#_#amildirs#.sql

## Slack

You can signup to the slack account [haakma.slack.com](https://haakma.slack.com/messages/C79KZ0LSJ) and receive notification messages of backups and other administrative processes.
