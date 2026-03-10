FROM debian:11-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      inetutils-telnetd=2:2.0-1+deb11u2 \
      telnet && \
    rm -rf /var/lib/apt/lists/*

RUN sed -i 's/bin\/bash/usr\/sbin\/nologin/' /etc/passwd && \
  sed -i 's/#<off># telnet/telnet/' /etc/inetd.conf && \
  echo > /etc/motd

COPY flag.sh /flagshell.sh
RUN echo "/flagshell.sh" > /etc/shells && \
    chmod 755 /flagshell.sh && \
    useradd skattctf -s /flagshell.sh -d /
EXPOSE 23
CMD ["/usr/sbin/inetutils-inetd", "-d"]