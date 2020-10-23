FROM nginx:stable

RUN apt-get update && apt-get install -y wget

RUN echo OK > /usr/share/nginx/html/system-status.txt

HEALTHCHECK CMD wget -q --method=HEAD localhost/system-status.txt