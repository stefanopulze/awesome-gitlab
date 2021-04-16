#!/bin/bash

docker-compose exec gitlab gitlab-rake gitlab:cleanup:orphan_lfs_files
docker-compose exec gitlab gitlab-rake gitlab:cleanup:project_uploads DRY_RUN=false
docker-compose exec gitlab gitlab-rake gitlab:cleanup:remote_upload_files DRY_RUN=false
docker-compose exec gitlab gitlab-rake gitlab:cleanup:orphan_job_artifact_files DRY_RUN=false
docker-compose exec gitlab gitlab-rake gitlab:cleanup:sessions:active_sessions_lookup_keys

# Clear cache
docker-compose exec gitlab gitlab-rake cache:clear