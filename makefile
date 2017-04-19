.PHONY: env install 

env:
	@mkdir -p _virtualenv
	virtualenv _virtualenv
	_virtualenv/bin/pip install -r requirements.txt
	echo . _virtualenv/bin/activate

README: README.md
	pandoc --from=markdown --to=rst README.md > README || cp README.md README

dist: README
	python setup.py sdist

clean:
	rm -f README
	rm -rf dist
	rm -rf build
	rm -rf docxicml.egg-info
	rm -rf _virtualenv

install: clean dist
	tar -xvzf dist/*.tar.gz -C dist --strip 1
	python dist/setup.py install --force
	env