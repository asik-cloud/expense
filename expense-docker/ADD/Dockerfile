FROM almalinux:9
RUN dnf install nginx -y
RUN mkdir /tmp
# CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]
LABEL user="Aashik" project="Devops"
ENV Course="Devops" \
    Duration="120hrs"
ADD https://github.com/asik-cloud/expense/archive/refs/heads/main.zip /tmp/