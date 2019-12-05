#!/bin/bash

kubectl1.14 apply \
    -f rafa-fullcontrol-role.yaml \
    -f rafa-fullcontrol-binding.yaml \
    -f shijit-fullcontrol-role.yaml \
    -f shijit-fullcontrol-binding.yaml