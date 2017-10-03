#!/bin/bash

REPO='github.com\/DinoInc\/BaseService'
THRIFT_VERSION="0.10.0"

if ! [ -x "$(command -v thrift)" ]; then
	echo "Thrift not found."
	exit 1
fi

current_version=$(thrift --version)

if [ "$current_version" != "Thrift version $THRIFT_VERSION" ]; then
	echo "Thrift version not match."
	exit 1
fi

cd model
./inflator -schema-dir=./schemas/ -schema-root=Patient -namespace=domain
if (($? != 0)); then
	echo "Fail to inflate thrift file."
	exit 1
fi
cd ..


thrift --gen go model/domain.thrift
gen_domain=$?
thrift --gen go model/contract.thrift
gen_contract=$?

if ((gen_domain == 0)) && ((gen_contract == 0)); then

	rm -rf domain
	rm -rf contract

	mv gen-go/* .

	sed -i "s/\"domain\"/\"$REPO\/domain\"/g" contract/*.go
	sed -i -f model/domain.sed domain/*.go

else

	echo "Thrift fail to generate source."
	rm -rf gen-go
	
	exit 1

fi

rmdir gen-go

echo "success."
