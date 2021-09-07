FROM  teamfruit/nginx-fcgiwrap
RUN apt-get update \
    && apt-get install python3-psycopg2 -y \
    && apt install postgresql postgresql-contrib -y

COPY create_table.py /usr/share/nginx/html

COPY run.sh /usr/share/nginx/html

#RUN chown nginx: -R /usr/share/nginx/
RUN chmod +x /usr/share/nginx/html/run.sh

COPY nginx.conf /etc/nginx/
EXPOSE 9000
CMD ["nginx", "-g", "daemon off;"]

