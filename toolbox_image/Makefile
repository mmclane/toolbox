SHELL = /bin/sh
MAKE_PATH=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: validate build build-test verify debug

validate:
	packer validate packer.json

validate-test:
	packer validate packer-testing.json

build:
	# del packerlog.txt
	packer build --force packer.json

build-cloud:
	packer build --force packer-cloud.json

verify:
	echo "verify not available"

full: validate build verify

debug:
	packer build -debug  -on-error=ask packer.json