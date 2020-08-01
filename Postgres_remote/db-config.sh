#!/usr/bin/env bash

passwd=$(U=barman; P=passw0rd; echo -n md5; echo -n $P$U | md5sum | cut -d' ' -f1)
psql -v ON_ERROR_STOP=1 -U "$POSTGRES_USER" -d "$POSTGRES_DB" <<-EOSQL
	CREATE USER barman WITH SUPERUSER PASSWORD '$passwd';
	GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO barman;
EOSQL
psql -v ON_ERROR_STOP=1 -d $POSTGRES_DB -U $POSTGRES_USER -c "ALTER USER $POSTGRES_USER WITH SUPERUSER PASSWORD '$POSTGRES_PASSWORD';"
psql -v ON_ERROR_STOP=1 -d $POSTGRES_DB -U $POSTGRES_USER -c "GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO $POSTGRES_USER;"
