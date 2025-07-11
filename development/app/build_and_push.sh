#!/bin/bash

docker build -t ghcr.io/yaozengzeng/vllm-mock:latest -f Dockerfile .

docker push ghcr.io/yaozengzeng/vllm-mock:latest
