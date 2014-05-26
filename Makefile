# usage:
# `make` or `make test` runs all the tests
# `make <test filename>` runs just that test
.PHONY: test clean test-cov

TESTS=$(shell cd test && ls *.coffee | sed s/\.coffee$$//)

all: test

test: $(TESTS)

$(TESTS):
	DEBUG=* NODE_ENV=test ./node_modules/.bin/mocha -r coffee-errors --compilers coffee:coffee-script/register test/$@.coffee

build: compile_coffee prepare_binary

compile_coffee:
	coffee --bare --compile --output lib/ src/*.coffee

prepare_binary:
	echo '#! /usr/bin/env node' > temp && cat lib/index.js >> temp && mv temp lib/index.js && chmod 755 lib/index.js

clean:
	rm -rf lib

test-cov:
	rm -rf lib
	COVERAGE=true ./node_modules/mocha/bin/mocha -r register-handlers.js --compilers coffee:coffee-script -R html-cov test > coverage.html
	open coverage.html
