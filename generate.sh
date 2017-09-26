#!/bin/bash

REPO='github.com\/DinoInc\/BaseService'
THRIFT_VERSION='0.10.0'

if ! [ -x "$(command -v thrift)" ]; then
	echo "Thrift not found."
	exit 1
fi

if ! [ ${thrift --version} -eq THRIFT_VERSION ]; then
	echo "Thrift version not match."
	exit 1
fi

thrift --gen go domain.thrift >/dev/null 2>&1
gen_domain=$?
thrift --gen go contract.thrift >/dev/null 2>&1
gen_contract=$?

if ((gen_domain == 0)) && ((gen_contract == 0)); then

	rm -rf domain
	rm -rf contract

	mv gen-go/* .

	sed -i "s/\"domain\"/\"$REPO\/domain\"/g" contract/*.go
	sed -i -f reserved_word.sed domain/*.go

else

	echo "Thrift fail to generate source."

fi

rmdir gen-go