# command
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: it
it: erase ## integration test
	docker system df -v
	docker-compose up -d --build
	docker-compose exec app sh install.sh
	docker-compose exec app nvim -c "checkhealth"

.PHONY: erase
erase: ## erase completely
	docker system df -v
	docker-compose down --rmi all
