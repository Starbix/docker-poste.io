FROM analogic/poste.io

RUN sed -i '/[::]:/ d' /etc/nginx/sites-enabled/default-https
RUN echo "listen = *" >> /etc/dovecot/dovecot.conf
RUN sed -i '8s/.*/IP=0.0.0.0/' /opt/qpsmtpd/run.forkserver
RUN sed -i '8s/.*/IP=0.0.0.0/' /opt/qpsmtpd/run.preforkserver
