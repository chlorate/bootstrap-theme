WEBPACK=node_modules/.bin/webpack
EXTERNAL_FILES=src/retro8.ttf src/retro16.ttf

.PHONY: build
build: $(EXTERNAL_FILES) node_modules
	$(WEBPACK) -p
	rm dist/styles.*.js

.PHONY: watch
watch: $(EXTERNAL_FILES) node_modules
	$(WEBPACK) -d --watch

.PHONY: clean
clean: 
	rm --recursive --force dist

.PHONY: clean-deps
clean-deps:
	rm --recursive --force node_modules src/*.ttf

node_modules: package.json
	npm install
	touch $@

src/retro8.ttf:
	curl https://raw.githubusercontent.com/chlorate/retro8/master/dist/retro8.ttf > $@

src/retro16.ttf:
	curl https://raw.githubusercontent.com/chlorate/retro16/master/dist/retro16.ttf > $@
