.PHONY: default lint doc

default: lint doc

lint:
	vint plugin/buffercount-flag.vim

doc: doc/buffercount-flag.txt

doc/buffercount-flag.txt: plugin/buffercount-flag.vim addon-info.json
	vimdoc .
