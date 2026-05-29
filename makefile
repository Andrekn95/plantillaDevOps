# Variables
SERVICE_NAME=holaflask
deployconip:
	@ docker run -d --name appap -p 7000:5000 ghcr.io/byronrm/holaflask:latest
deploy:
	@ docker stack deploy --with-registry-auth -c stack.yml holaflask

network:
	@docker network create -d overlay --scope swarn holaflask_net

volumenes:
	@docker volume create v_andres


# Construir la imagen
build:
	docker compose build

# Levantar el servicio
up:
	docker compose up -d

# Ver logs del servicio
logs:
	docker compose logs -f $(SERVICE_NAME)

# Detener los contenedores
down:
	docker compose down

# Reconstruir completamente el servicio
rebuild: down build up

# Limpiar imágenes huérfanas
clean:
	docker system prune -f