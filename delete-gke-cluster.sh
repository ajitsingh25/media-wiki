#!/bin/sh

ZONE=us-central1-a

#MACHINE_TYPE=n1-standard-1
CLUSTER_NAME=mycluster

##Create cluster using default version
gcloud container clusters delete $CLUSTER_NAME \
    --zone $ZONE
