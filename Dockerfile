FROM analogic/poste.io

RUN sed -i '/[::]:/ d' /etc/nginx/sites-enabled/default-https
RUN sed -i '/IP=*,::/c\IP=*'  /etc/dovecot/dovecot.conf
RUN mkdir /etc/services.d/fixipv6
RUN touch /etc/services.d/fixipv6/run
RUN echo "sed -i '8s/.*/IP=0.0.0.0/' /opt/qpsmtpd/run.forkserver" >> /etc/services.d/fixipv6/run
RUN echo "sed -i '8s/.*/IP=0.0.0.0/' /opt/qpsmtpd/run.preforkserver" >> /etc/services.d/fixipv6/run
RUN chmod 755 /etc/services.d/fixipv6/run
