git config --global credential.helper store
echo "https://gitlab-ci-token:$CI_JOB_TOKEN@gitlab.com" > ~/.git-credentials
