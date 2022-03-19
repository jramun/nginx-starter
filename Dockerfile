FROM openresty/openresty:alpine

# Configuration
ARG LUAROCKS_VER=3.8.0

RUN apk add --no-cache --update build-base unzip \
    && cd /tmp \
    && wget https://luarocks.org/releases/luarocks-$LUAROCKS_VER.tar.gz \
    && tar zxpf luarocks-$LUAROCKS_VER.tar.gz \
    && cd luarocks-$LUAROCKS_VER \
    && ./configure --with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1 \
    && make \
    && make install \
    && rm -rf /tmp/*
    
COPY nginx.conf /usr/local/openresty/nginx/conf/
COPY commons/ /usr/local/openresty/nginx/conf/commons/
COPY conf.d/ /usr/local/openresty/nginx/conf/conf.d/
COPY luas/ /usr/local/openresty/nginx/conf/luas/
# COPY modules/ /usr/local/openresty/nginx/modules/

# Storages
COPY storages/ /var/openresty/storages/

# Logs
COPY logs/ /var/openresty/logs/

# Symlink the logs to stdout and stderr
# RUN ln -sf /dev/stdout /var/openresty/logs/access.log
# RUN ln -sf /dev/stderr /var/openresty/logs/error.log
