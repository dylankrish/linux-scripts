#!/bin/bash

# github username
username = dylankrish

# get user ssh keys
curl https://github.com/$username.keys | tee -a ~/.ssh/authorized_keys

# disable password auth


