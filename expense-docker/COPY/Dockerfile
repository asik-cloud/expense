FROM almalinux:9
RUN dnf install nginx -y
RUN rm /usr/share/nginx/html/*
# CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]
LABEL user="Aashik" project="Devops"
ENV Course="Devops" \
    Duration="120hrs"
COPY . /usr/share/nginx/html