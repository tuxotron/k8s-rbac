#!/bin/bash

kubectl1.14 apply \
    -f developers-role.yaml \
    -f developers-binding.yaml