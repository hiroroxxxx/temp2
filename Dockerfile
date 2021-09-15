FROM registry.access.redhat.com/ubi7/ubi:7.8
RUN { \
      echo '[nginx-stable]'; \
      echo 'name=nginx stable repo'; \
      echo 'baseurl=http://nginx.org/packages/centos/$releasever/$basearch/'; \
      echo 'gpgcheck=1'; \
      echo 'enabled=1'; \
      echo 'gpgkey=https://nginx.org/keys/nginx_signing.key'; \
      echo 'module_hotfixes=true'; \
      echo ''; \
      echo '[nginx-mainline]'; \
      echo 'name=nginx mainline repo'; \
      echo 'baseurl=http://nginx.org/packages/mainline/centos/$releasever/$basearch/'; \
      echo 'gpgcheck=1'; \
      echo 'enabled=0'; \
      echo 'gpgkey=https://nginx.org/keys/nginx_signing.key'; \
      echo 'module_hotfixes=true'; \
    }  > /etc/yum.repos.d/nginx.repo
RUN yum install -y --disableplugin=subscription-manager nginx && yum clean all
RUN yum install -y --disableplugin=subscription-manager ftp && yum clean all
ENTRYPOINT ["nginx"]
CMD ["-g","daemon off;"]
