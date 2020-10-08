.PHONY: help setup dependencies install clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	dependencies \
	.env

.env:
	touch $@

clean:
	rm .env
