#!/bin/sh

#Key and cert signing request for Shijit
openssl genrsa -out shijit.key 2048
openssl req -new -key shijit.key -out shijit.csr -subj "/CN=shijit/O=developers"

# Key and cert signing request for Rafa
openssl genrsa -out rafa.key 2048
openssl req -new -key rafa.key -out rafa.csr -subj "/CN=rafa/O=developers"

# Sign requests. Certs for both users. If you minikube installed in a different path than ~/.minikube, make the adjustments
openssl x509 -req -in shijit.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out shijit.crt -days 90
openssl x509 -req -in rafa.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out rafa.crt -days 90

# Create the users
kubectl config set-credentials shijit --client-certificate=shijit.crt --client-key=shijit.key
kubectl config set-credentials rafa --client-certificate=rafa.crt --client-key=rafa.key

# Let's create new contexts for these users
kubectl config set-context shijit --cluster=minikube --user=shijit --namespace=shijit
kubectl config set-context rafa --cluster=minikube --user=rafa --namespace=rafa

# Let's create new namespaces
kubectl create namespace shijit
kubectl create namespace rafa
kubectl create namespace developers