FROM analogic/poste.io

COPY fail2ban.patch /tmp

RUN apt-get update && apt-get install fail2ban patch \
  && echo "listen = *" >> /etc/dovecot/dovecot.conf \
  && sed -i '/[::]:/ d' /etc/nginx/sites-enabled/default-https \
  && sed -i '8s/.*/IP=0.0.0.0/' /opt/qpsmtpd/run.forkserver \
  && sed -i '8s/.*/IP=0.0.0.0/' /opt/qpsmtpd/run.preforkserver \
  && patch /opt/qpsmtpd/lib/Qpsmtpd/Auth.pm /tmp/fail2ban.patch \
  && echo -e "[qpsmtpd]\nenabled = true\nport	= smtp,ssmtp\nfilter	= qpsmtpd\nlogpath	= /var/log/qpsmtpd/*-total\n" >> /etc/fail2ban/jail.conf \
  && apt-get remove patch && rm -rf /tmp && rm -rf /var/lib/apt/lists/*
