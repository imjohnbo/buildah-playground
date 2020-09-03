FROM nginx

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY startup.sh /startup.sh

WORKDIR /usr/share/nginx/html
COPY site .

CMD /startup.sh