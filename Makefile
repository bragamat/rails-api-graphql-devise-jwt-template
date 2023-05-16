.DEFAULT_GOAL := server

db-up:
	docker-compose up db -d

bundle:
	bundle

build: bundle  db-up
	rails db:environment:set RAILS_ENV=development db:drop db:create db:migrate

seed: build
	rails db:seed

lint:
	rubocop -A

console:
	rails console

server:
	rails s

tests: db-up
	rspec

erd: db-up
	bundle exec erd
