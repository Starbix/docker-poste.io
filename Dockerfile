FROM analogic/poste.io

RUN sed -i '/[::]:/ d' /etc/nginx/sites-enabled/default-https \
    sed -i '/IP=*,::/c\IP=*'  /etc/dovecot/dovecot.conf \
    mkdir /etc/services.d/fixipv6 \
    touch /etc/services.d/fixipv6/run \
    echo "sed -i '8s/.*/IP=0.0.0.0/' /opt/qpsmtpd/run.forkserver" >> /etc/services.d/fixipv6/run \
    echo "sed -i '8s/.*/IP=0.0.0.0/' /opt/qpsmtpd/run.preforkserver" >> /etc/services.d/fixipv6/run \
    chmod 755 /etc/services.d/fixipv6/run
