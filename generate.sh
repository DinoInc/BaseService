#!/bin/bash

REPO='github.com\/DinoInc\/BaseService'

rm -rf domain
rm -rf contract

thrift --gen go domain.thrift
thrift --gen go contract.thrift

mv gen-go/* .

sed -i "s/\"domain\"/\"$REPO\/domain\"/g" contract/*.go
sed -i -f reserved_word.sed domain/*.go

rmdir gen-go