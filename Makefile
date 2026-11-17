.PHONY: build up down logs migrate superuser shell
COMPOSE = docker compose -f docker-demo/frontend/docker-compose.yml

build:
	$(COMPOSE) build
up:
	$(COMPOSE) up -d --build
down:
	$(COMPOSE) down
logs:
	$(COMPOSE) logs -f backend
migrate:
	$(COMPOSE) exec backend python manage.py migrate
superuser:
	$(COMPOSE) exec backend python manage.py createsuperuser
shell:
	$(COMPOSE) run --rm backend sh

.PHONY: build up down logs migrate superuser shell push
 
DOCKER_ID = manoj1530
BACKEND = nxttrendz-backend
FRONTEND = nxttrendz-frontend
VERSION = v1
LATEST = latest
 
push: build
	docker tag $(BACKEND) $(DOCKER_ID)/$(BACKEND):$(VERSION)
	docker tag $(BACKEND) $(DOCKER_ID)/$(BACKEND):$(LATEST)
	docker push $(DOCKER_ID)/$(BACKEND):$(VERSION)
	docker push $(DOCKER_ID)/$(BACKEND):$(LATEST)
	
	docker tag $(FRONTEND) $(DOCKER_ID)/$(FRONTEND):$(VERSION)
	docker tag $(FRONTEND) $(DOCKER_ID)/$(FRONTEND):$(LATEST)
	docker push $(DOCKER_ID)/$(FRONTEND):$(VERSION)
	docker push $(DOCKER_ID)/$(FRONTEND):$(LATEST)	