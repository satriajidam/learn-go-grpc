#!/bin/bash

v1_src_path="api/proto/v1"
v1_dest_path="pkg/api/v1"

mkdir -p $v1_dest_path

for f in "$v1_src_path/*"; do
  if [ -d "$f" ]; then
    continue
  fi
  protoc --proto_path=$v1_src_path --go_out=plugins=grpc:. $f
done
