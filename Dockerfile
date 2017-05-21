FROM analogic/poste.io

RUN echo "listen = *" >> /etc/dovecot/dovecot.conf \
  && sed -i '/[::]:/ d' /etc/nginx/sites-enabled/default-https \
  && sed -i '8s/.*/IP=0.0.0.0/' /opt/qpsmtpd/run.forkserver \
  && sed -i '8s/.*/IP=0.0.0.0/' /opt/qpsmtpd/run.preforkserver \
  && rm -rf /tmp/*
