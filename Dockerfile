FROM analogic/poste.io

RUN sed -i '/[::]:/ d' /etc/nginx/sites-enabled/default-https \
    sed -i '/IP=*,::/c\IP=*'  /etc/dovecot/dovecot.conf \
    
