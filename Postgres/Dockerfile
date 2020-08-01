# Dockerfile

# Postgres
FROM postgres:9.5
ENV POSTGRES_USER dbadmin	 
ENV POSTGRES_DB db
ENV POSTGRES_PASSWORD passw0rd


# SSH Setup
RUN apt-get update && apt-get install -y openssh-server rsync && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo "Host *barman*" >> /etc/ssh/ssh_config && echo " StrictHostKeyChecking no" >> /etc/ssh/ssh_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo "export POSTGRES_USER=dbadmin" >> /etc/profile
RUN echo "export POSTGRES_DB=db" >> /etc/profile
RUN echo "export POSTGRES_PASSWORD=passw0rd" >> /etc/profile

RUN mkdir -p ~/.ssh && chmod 700 ~/.ssh && touch ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys
RUN su - postgres -c "mkdir -p ~postgres/.ssh && chmod 700 ~postgres/.ssh && touch ~postgres/.ssh/authorized_keys && chmod 600 ~postgres/.ssh/authorized_keys"


# Custom config
RUN mkdir -p /var/lib/postgresql/config/
COPY pg_hba.conf /var/lib/postgresql/config/
RUN chown -R postgres: /var/lib/postgresql/config/

COPY db-config.sh /docker-entrypoint-initdb.d/

# Custom entrypoint
COPY custom-docker-entrypoint.sh /
RUN chmod +x /custom-docker-entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/custom-docker-entrypoint.sh"]
CMD ["postgres"]

