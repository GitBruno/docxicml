.PHONY: env

env:
	@mkdir -p _virtualenv
	virtualenv _virtualenv
	_virtualenv/bin/pip install -r requirements.txt