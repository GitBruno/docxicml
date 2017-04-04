.PHONY: env install

env:
	@mkdir -p _virtualenv
	virtualenv _virtualenv
	_virtualenv/bin/pip install -r requirements.txt
	echo . _virtualenv/bin/activate

README: README.md
	pandoc --from=markdown --to=rst README.md > README || cp README.md README

assert-converted-readme:
	test "`cat README`" != "`cat README.md`"

setup: README

install:
	env