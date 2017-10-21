dns-container:
	docker run -d --restart=always -p 53\:53/tcp \
		-p 53\:53/udp \
		--cap-add=NET_ADMIN \
		andyshinn/dnsmasq\:latest
vpn-container:
	docker run -d --restart=always \
		--cap-add NET_ADMIN \
		-p 500\:500/udp -p 4500\:4500/udp \
		-p 1701\:1701/tcp -p 1194\:1194/udp \
		-p 5555\:5555/tcp -p 992\:992/tcp \
		-e USERS='***'\:'***' \
		-e PSK=*** \
		siomiz/softethervpn
nginx-container:
	docker run -d --restart=always \
		-p 80\:80 -p 443\:443 \
		--name nginx \
		--mount type=bind,source=/root/octopress/public,target=/usr/share/nginx/html,readonly \
		--mount type=bind,source=/root/octopress/nginx,target=/etc/nginx/conf.d,readonly \
		--mount type=bind,source=/etc/letsencrypt,target=/etc/letsencrypt,readonly \
		nginx\:alpine
certbot-container:
	docker run --rm \
		--mount type=bind,source=/etc/letsencrypt,target=/etc/letsencrypt \
		certbot/certbot \
		certonly -d terrty.net --standalone -m paskal.07@gmail.com --agree-tos

build-blog:
	docker run -it --rm \
		--mount type=bind,source=$(PWD)/source/,target=/data/source/ \
		--mount type=bind,source=$(PWD)/public/,target=/data/public/ \
		paskal/octopress \
		generate

build-image:
	docker build -t paskal/octopress .
