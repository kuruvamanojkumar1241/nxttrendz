COMPOSE = docker compose -f frontend/docker-compose.yml

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