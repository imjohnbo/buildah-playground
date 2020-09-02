FROM nginx

COPY nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /usr/share/nginx/html
COPY site .

ARG GITHUB_SHA=12345
ARG GITHUB_REF=ref/heads/master
ENV SHA=$GITHUB_SHA
ENV REF=$GITHUB_REF

RUN sed -i 's,SHA,'"$GITHUB_SHA"',' index.html
RUN sed -i 's,REF,'"$GITHUB_REF"',' index.html

CMD nginx -g 'daemon off;'