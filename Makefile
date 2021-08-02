NPM=npm
mode=prod
MAKE=make

.PHONY: all
all:
	$(NPM) run build:$(mode)

.PHONY: version
version:
	git tag $(V)
	./scripts/changelog.sh
	$(NPM) version $(V) --no-git-tag-version
	git add package.json
	git add package-lock.json
	git add ./docs/changelogs/CHANGELOG_$(V).md
	git add docs
	git commit --allow-empty -m "Build $(V)"
	git tag --delete $(V)
	git tag $(V)

.PHONY: install
install:
	$(NPM) install

.PHONY: lint
lint:
	$(NPM) run lint
	$(NPM) run csslint

.PHONY: fix
fix:
	$(NPM) run prettify
	$(NPM) run lint:fix
	$(NPM) run csslint:fix

.PHONY: help
help:
	@echo  '=================================='
	@echo  'Available tasks:'
	@echo  '=================================='
	@echo  '* Installation:'
	@echo  '- install         - Phony task that installs all required dependencies'
	@echo  ''
	@echo  '* Quality:'
	@echo  '- lint            - Phony task that runs all linting tasks'
	@echo  '- fix             - Fixes some linting errors
	@echo  ''
	@echo  '* Release:'
	@echo  '- version         - Phony task. Creates changelog from latest'
	@echo  '                    git tag till the latest commit. Creates commit'
	@echo  '                    with given version (as argument) and tags'
	@echo  '                    this commit with this version. Version has to'
	@echo  '                    be passed as `V` argument with ex. `v0.0.0`'
	@echo  '                    format'.
	@echo  '                    Example: $ make version V=v0.0.0.
	@echo  ''

