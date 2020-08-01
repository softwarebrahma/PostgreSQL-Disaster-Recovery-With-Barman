# PostgreSQL-Disaster-Recovery-With-Barman
A complete end-end project that demonstrates PostgreSQL Disaster Recovery. The project demonstrates the solution using Barman (Backup and Recovery Manager), an open-source administration tool for disaster recovery of PostgreSQL servers. 

The solution architecture chosen here is a 'Traditional backup with WAL streaming' architecture implementation (Backup via rsync/SSH + WAL streaming). This is chosen as it provides incremental backup/restore &amp; a bunch of other features. More details can be found at .

About the project:

The project demonstrates a working docker setup involving PostgreSQL and Barman docker containers. 

The setup actually consists of two pairs or PostgreSQL & Barman docker containers (each in their own docker network) to represent the Primary & Standby. The PostgreSQL database in the Primary is incrementally backed up in a nightly schedule & is restored remotely in the Standby.


