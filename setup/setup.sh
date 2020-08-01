#!/usr/bin/env bash

# Local end setup..

mkdir /root/incremental_backup_restore_demo/postgresdatabase/db
mkdir /root/incremental_backup_restore_demo/postgresdatabase/db/sshkeys
mkdir /root/incremental_backup_restore_demo/postgresdatabase/db/data

mkdir /root/incremental_backup_restore_demo/pgbarman/
mkdir /root/incremental_backup_restore_demo/pgbarman/sshkeys
mkdir /root/incremental_backup_restore_demo/pgbarman/log
mkdir /root/incremental_backup_restore_demo/pgbarman/backupcfg
mkdir /root/incremental_backup_restore_demo/pgbarman/backups

ssh-keygen -b 4096 -t rsa -N '' -f /root/incremental_backup_restore_demo/postgresdatabase/db/sshkeys/id_rsa
ssh-keygen -f /root/.ssh/id_rsa -y >> /root/incremental_backup_restore_demo/postgresdatabase/db/sshkeys/authorized_keys

ssh-keygen -b 4096 -t rsa -N '' -f /root/incremental_backup_restore_demo/pgbarman/sshkeys/id_rsa
ssh-keygen -f /root/.ssh/id_rsa -y >> /root/incremental_backup_restore_demo/pgbarman/sshkeys/authorized_keys

ssh-keygen -f /root/incremental_backup_restore_demo/postgresdatabase/db/sshkeys/id_rsa -y >> /root/incremental_backup_restore_demo/pgbarman/sshkeys/authorized_keys
ssh-keygen -f /root/incremental_backup_restore_demo/pgbarman/sshkeys/id_rsa -y >> /root/incremental_backup_restore_demo/postgresdatabase/db/sshkeys/authorized_keys

chmod -R 777 /root/incremental_backup_restore_demo/pgbarman/sshkeys/*
chmod -R 777 /root/incremental_backup_restore_demo/postgresdatabase/db/sshkeys/*

cp postgres-source-db.conf /root/incremental_backup_restore_demo/pgbarman/backupcfg/.


# Remote end setup..

mkdir /root/incremental_backup_restore_demo/postgresdatabase/db_remote
mkdir /root/incremental_backup_restore_demo/postgresdatabase/db_remote/sshkeys
mkdir /root/incremental_backup_restore_demo/postgresdatabase/db_remote/data

mkdir /root/incremental_backup_restore_demo/pgbarman_remote/
mkdir /root/incremental_backup_restore_demo/pgbarman_remote/sshkeys
mkdir /root/incremental_backup_restore_demo/pgbarman_remote/log
mkdir /root/incremental_backup_restore_demo/pgbarman_remote/backupcfg
mkdir /root/incremental_backup_restore_demo/pgbarman_remote/backups

ssh-keygen -b 4096 -t rsa -N '' -f /root/incremental_backup_restore_demo/postgresdatabase/db_remote/sshkeys/id_rsa
ssh-keygen -f /root/.ssh/id_rsa -y >> /root/incremental_backup_restore_demo/postgresdatabase/db_remote/sshkeys/authorized_keys

ssh-keygen -b 4096 -t rsa -N '' -f /root/incremental_backup_restore_demo/pgbarman_remote/sshkeys/id_rsa
ssh-keygen -f /root/.ssh/id_rsa -y >> /root/incremental_backup_restore_demo/pgbarman_remote/sshkeys/authorized_keys

ssh-keygen -f /root/incremental_backup_restore_demo/postgresdatabase/dcm_db_remote/sshkeys/id_rsa -y >> /root/incremental_backup_restore_demo/pgbarman_remote/sshkeys/authorized_keys
ssh-keygen -f /root/incremental_backup_restore_demo/pgbarman_remote/sshkeys/id_rsa -y >> /root/incremental_backup_restore_demo/postgresdatabase/dcm_db_remote/sshkeys/authorized_keys

chmod -R 777 /root/incremental_backup_restore_demo/pgbarman_remote/sshkeys/*
chmod -R 777 /root/incremental_backup_restore_demo/postgresdatabase/dcm_db_remote/sshkeys/*

cp /root/incremental_backup_restore_demo/pgbarman/backupcfg/postgres-source-db.conf /root/incremental_backup_restore_demo/pgbarman_remote/backupcfg/.


