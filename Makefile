CONSOLE_OPTS=-e COLUMNS="`tput cols`" -e LINES="`tput lines`"

.PHONY: console
console: RAILS_CMD = c
console: rails

.PHONY: rails
rails:
	docker-compose run --rm $(CONSOLE_OPTS) rails bundle exec rails $(RAILS_CMD)

.PHONY: start
start: ## start development containers
	docker-compose up -d

.PHONY: stop
stop: ## stop and remove dev containers
	docker-compose down --remove-orphans

.PHONY: restart
restart: stop start ## recompile and restart

.PHONY: rebuild
rebuild: stop
	docker-compose up -d --build

.PHONY: tc
tc: ## run type-checker
	docker-compose run --rm $(CONSOLE_OPTS) rails bundle exec srb tc

.PHONY: help
help: ## this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
