#!/bin/bash

REPO='github.com\/DinoInc\/BaseService'

rm -rf domain
rm -rf contract

thrift --gen go domain.thrift
thrift --gen go contract.thrift

mv gen-go/* .

sed -i "s/\"domain\"/\"$REPO\/domain\"/g" contract/*.go

rmdir gen-go