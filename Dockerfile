FROM nginx
ENV WD /usr/share/nginx/html
WORKDIR ${WD}
ADD index.html ${WD}
ADD default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
