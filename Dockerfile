FROM analogic/poste.io

RUN sed '/[::]:/ d' /etc/nginx/sites-enabled/default-https > temp && mv temp /etc/nginx/sites-enabled/default-https \
    sed '/#listen = */ d' /etc/dovecot/dovecot.conf > temp2 && mv temp2 /etc/dovecot/dovecot.conf \
    echo "listen = *" >> /etc/dovecot/dovecot.conf \
    sed -i '8s/.*/IP=0.0.0.0/' /opt/qpsmtpd/run.forkserver \
    sed -i '8s/.*/IP=0.0.0.0/' /opt/qpsmtpd/run.preforkserver
