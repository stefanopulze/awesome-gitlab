#!/bin/bash

docker-compose exec gitlab gitlab-backup create SKIP=builds,artifacts