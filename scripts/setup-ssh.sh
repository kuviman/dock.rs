if ! which ssh ; then
	echo SSH not available
    return
fi

eval $(ssh-agent -s)

mkdir -p ~/.ssh
chmod 700 ~/.ssh
cat > ~/.ssh/config <<"EOF"
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null
EOF
chmod 400 ~/.ssh/config

if [ -n "$SSH_KEY" ]; then
	echo "$SSH_KEY" | tr -d '\r' | ssh-add - > /dev/null
	echo SSH key added
fi
