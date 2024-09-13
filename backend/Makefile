RAILS_ENV ?= development

.PHONY: rbs
rbs:
	rbs collection install
	bin/rails rbs_rails:all

.PHONY: db-apply
db-apply:
	docker compose exec backend bundle exec ridgepole -c config/database.yml -E $(RAILS_ENV) --apply -f db/schema_file.rb && bin/rails db:schema:dump
