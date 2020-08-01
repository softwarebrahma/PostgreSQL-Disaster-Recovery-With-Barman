# PostgreSQL-Disaster-Recovery-With-Barman
A complete end-end project that demonstrates PostgreSQL Disaster Recovery. 

The project demonstrates the solution using Barman (Backup and Recovery Manager), an open-source administration tool for disaster recovery of PostgreSQL servers. 

The solution architecture chosen here is a 'Traditional backup with WAL streaming' architecture implementation (Backup via rsync/SSH + WAL streaming). This is chosen as it provides incremental backup/restore &amp; a bunch of other features. More details can be found at http://www.pgbarman.org/.

About the project:

The project demonstrates a working docker setup involving PostgreSQL and Barman docker containers. 

The setup actually consists of two pairs of PostgreSQL &amp; Barman docker containers (each in their own docker network) to represent the Primary &amp; Standby. The PostgreSQL database in the Primary is incrementally backed up in a nightly schedule &amp; is restored remotely in the Standby.

To use this project, please start with the setup.sh file under setup folder &amp; make changes as needed or run as is. This assumes a standard debian linux host with docker/docker-compose already installed &amp; ready for use. 

To build one would use the standard command 'docker-compose -f docker-compose.yml build' &amp; to run again the standard command, 'docker-compose -f docker-compose.yml up -d'.

Please use populate_primary_db.sql under setup folder to populate the PostgreSQL database in Primary.

Note that this is just a basic demonstratation of the Disaster Recovery Functionality where things like security &amp; other considerations are not in focus. Any use of this therefore is intended only as a quick guide for the aforementioned demonstratation purpose.
