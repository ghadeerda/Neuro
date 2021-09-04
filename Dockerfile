FROM nginx
COPY script.py /usr/share/nginx/html
COPY script.sh /usr/share/nginx/html
RUN chmod u+x /usr/share/nginx/html/script.sh
COPY nginx.conf /etc/nginx/
EXPOSE 9000
CMD ["nginx", "-g", "daemon off;"]

