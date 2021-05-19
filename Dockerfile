# copy from code from source
FROM ubuntu:latest as source-code
RUN apt-get update        
RUN apt-get install -y git
# RUN mkdir /docfxapp 
# RUN cd /docfxapp      
# creds to access (git hub action token)   
RUN git clone https://github.com/RybalkoValeriy/dockerTest.git     
# WORKDIR /docfxapp

# # docfx-build
FROM tsgkadot/docker-docfx:latest as docfx-build
WORKDIR /app 
COPY --from=source-code dockerTest/ .
RUN docfx docfx_project/docfx.json --serve


# nginx
FROM nginx:latest

ARG user=user1
ARG password=123456

WORKDIR /usr/share/nginx/html
RUN apt-get update
RUN apt install -y apache2-utils
RUN htpasswd -cb /etc/nginx/.htpasswd ${user} ${password}

COPY --from=docfx-build app/docfx_project/_site .
# COPY --from=docfx-build app/nginx/.htpasswd /etc/nginx/
COPY --from=docfx-build app/nginx/default.conf /etc/nginx/conf.d/


