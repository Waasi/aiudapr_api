init-psql:
	$(info Initializing PSQL Server)
	pg_ctl init -D aiuda_db

start-psql:
	$(info Starting PSQL Server)
	pg_ctl -D aiuda_db start

stop-psql:
	$(info Stopping PSQL Server)
	pg_ctl -D aiuda_db stop

setup-psql:
	$(info Starting DB Setup)
	psql -U postgres -c "CREATE USER postgres WITH SUPERUSER PASSWORD 'postgres';"

prepare:
	createuser -s postgres

setup:
	$(info Starting DB Setup)
	mix ecto.setup

reset:
	$(info Starting DB Reset)
	mix ecto.reset

migrate:
	$(info Starting DB Migration)
	mix ecto.migrate

compile:
	$(info Starting Compilation)
	mix compile

server:
	$(info Starting Web Server)
	mix phx.server

test:
	$(info Starting Unit Tests)
	mix test

deps:
	$(info Starting Dependencies Fetch)
	mix deps.get

console:
	iex -S mix phx.server
