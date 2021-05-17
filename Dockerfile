#

# docfx-build
FROM tsgkadot/docker-docfx:latest as docfx-build
WORKDIR /app 
COPY . .
RUN docfx docfx_project/docfx.json --serve


# nginx
FROM nginx:latest
WORKDIR /usr/share/nginx/html
COPY --from=docfx-build app/docfx_project/_site .

COPY ./nginx/.htpasswd /etc/nginx/
COPY ./nginx/default.conf /etc/nginx/conf.d/


