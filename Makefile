up:
	docker-compose up -d

down:
	docker-compose down

restart:
	docker-compose restart

mk-env:
	virtualenv -p python3 env

vrun:
	source env/bin/activate

install-lib:
	pip install -r requirements.txt

run-opentelemetry:
	opentelemetry-bootstrap -a install

config-pgadmin:
	curl -X POST \
	  -H "Content-Type: application/json" \
	  -d '{"name":"postgres", "host":"localhost", "port":5432, "sslMode":"prefer", "maintenanceDB":"postgresql-primary", "username":"postgres", "password":"postgres"}' \
	  http://localhost:8080/servers

run-generate:
	python3 generate.py
