FROM registry.access.redhat.com/ubi8-minimal:latest
LABEL mantainer Francesco Zanti <francesco@tekapp.it>

USER 0

RUN microdnf install dbus-x11 PackageKit-gtk3-module libcanberra-gtk3 firefox -y
RUN microdnf clean all && rm -rf /var/cache/dnf

COPY entrypoint.sh /entrypoint.sh

RUN chmod ugo+x /entrypoint.sh 

ENTRYPOINT [ "/entrypoint.sh" ]

CMD []