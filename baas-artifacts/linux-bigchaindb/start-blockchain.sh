#!/bin/bash
cd bigchaindb
docker-compose up -d
docker-compose run --rm bigchaindb bigchaindb-benchmark load

