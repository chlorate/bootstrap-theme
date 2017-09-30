WEBPACK=node_modules/.bin/webpack
WEBPACK_DEV_SERVER=node_modules/.bin/webpack-dev-server
EXTERNAL_FILES=src/retro8.ttf src/retro16.ttf

.PHONY: build
build: $(EXTERNAL_FILES) node_modules
	$(WEBPACK) -p
	rm dist/styles.*.js

.PHONY: watch
watch: $(EXTERNAL_FILES) node_modules
	$(WEBPACK_DEV_SERVER)

.PHONY: clean
clean: 
	rm --recursive --force dist

.PHONY: clean-deps
clean-deps:
	rm --recursive --force node_modules src/*.ttf

node_modules: package.json
	npm install

src/retro8.ttf:
	curl https://raw.githubusercontent.com/chlorate/retro8/master/dist/retro8.ttf > $@

src/retro16.ttf:
	curl https://raw.githubusercontent.com/chlorate/retro16/master/dist/retro16.ttf > $@
