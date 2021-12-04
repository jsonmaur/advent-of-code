DAY=1

.EXPORT_ALL_VARIABLES:
.PHONY: run format

run:
	@elixir -r helpers.exs -r day$(DAY)/**/*.exs

format:
	@mix format **/*.exs
