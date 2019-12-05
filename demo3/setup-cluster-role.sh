#!/bin/bash

kubectl1.14 apply \
    -f namespaces-cluster-role.yaml \
    -f namespaces-cluster-role-binding.yaml