build:
	(cd service-worker; npm run build)
	-mkdir public
	rm -f public/*
	cp service-worker/dist-prod/* public
	firebase deploy

setup:
        @echo install npm
        (cd service-worker; npm install)
        npm install -g firebase-tools
        firebase login
        @echo "Edit CANSTER_ID and MY_DOMAIN in ./service-worker/src/sw/http_request.ts"
        @read -p "Text Editor [nano]:" EDITOR; \
        $${EDITOR:-nano} service-worker/src/sw/http_request.ts
        mkdir public
        firebase init
