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