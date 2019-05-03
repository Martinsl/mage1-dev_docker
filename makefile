.PHONY: install start stop restart

help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

install:	## Builds dockerfiles
	docker-compose build

start:		## Exports necessary variables and starts the containers in daemon mode
	docker-compose up -d

stop:		## Shuts down every container
	docker-compose down

restart: stop start ## Restart
