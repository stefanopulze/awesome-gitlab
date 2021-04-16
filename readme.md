# Awesome Gitlab

Curated list of command and tips and trick to manage and maintain gitlab

## Backup

[Official documentation](https://docs.gitlab.com/ee/raketasks/backup_restore.html)

```bash
gitlab-backup create SKIP=builds,artifacts
```

**SKIP** params can ben configure to skip some resources from backup

For a complete backup, remember to backup the secret files: `/etc/gitlab/gitlab-secrets.json`, `/etc/gitlab/gitlab.rb`



## Cleanup

<pre>Do not run this within 12 hours of a GitLab upgrade</pre>

```bash
gitlab-rake gitlab:cleanup:orphan_lfs_files
gitlab-rake gitlab:cleanup:project_uploads DRY_RUN=false
gitlab-rake gitlab:cleanup:remote_upload_files DRY_RUN=false
gitlab gitlab-rake gitlab:cleanup:orphan_job_artifact_files DRY_RUN=false
gitlab-rake gitlab:cleanup:sessions:active_sessions_lookup_keys

# Clear cache
gitlab-rake cache:clear
```

