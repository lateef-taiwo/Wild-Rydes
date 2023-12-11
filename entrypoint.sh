
#!/bin/sh

set -ue

repository_name="${wild-rides-repo}"
aws_region="${us-east-1}"
CodeCommitUrl="https://git-codecommit.${aws_region}.amazonaws.com/v1/repos/${repository_name}"

git config --global --add safe.directory /github/workspace
git config --global credential.'https://git-codecommit.*.amazonaws.com'.helper '!aws codecommit credential-helper $@'
git config --global credential.UseHttpPath true
git remote add sync ${CodeCommitUrl}
git push sync --mirror
