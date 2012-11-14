#!/bin/bash

# Set up ssh agent
# ================
# Check for existing agent
: ${SSH_AGENT_PID:=0}
if [ -f ~/.ssh/agent ]; then
    source ~/.ssh/agent > /dev/null
fi
# Start one if none exists
ps -p $SSH_AGENT_PID | grep ssh-agent > /dev/null || {
    ssh-agent > ~/.ssh/agent
    source ~/.ssh/agent > /dev/null
}

# Check for the key in the agent
SSHKEY=~/.ssh/id_rsa
if [ -f $SSHKEY ]; then
    ssh-add -L | grep "$(cat $SSHKEY.pub | sed 's/==.*$//')" > /dev/null || { 
        # Only add the key if interactive
        if [ -n "$PS1" ]; then
            ssh-add -t 24h $SSHKEY
        else
            echo "WARNING: $(hostname) ssh key expired"
        fi
    }
fi

