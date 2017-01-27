FROM analogic/poste.io

RUN sed '/[::]:/ d' /etc/nginx/sites-enabled/default-https > temp && mv temp /etc/nginx/sites-enabled/default-https \
    sed -i '/IP=*,::/c\IP=*'  /etc/dovecot/dovecot.conf \
    sed -i '8s/.*/IP=0.0.0.0/' /opt/qpsmtpd/run.forkserver \
    sed -i '8s/.*/IP=0.0.0.0/' /opt/qpsmtpd/run.preforkserver
